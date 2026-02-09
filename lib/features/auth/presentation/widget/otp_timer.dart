import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key});

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  int _start = 60;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() => timer.cancel());
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
      children: [
        Text(
          "$_start",
          style: TextStyle(
            fontSize: responsive.scaleWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: responsive.scaleHeight(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Not received? ",
              style: TextStyle(
                fontSize: responsive.scaleWidth(16),
                color: AppColors.black,
              ),
            ),
            GestureDetector(
              onTap: _start == 0
                  ? () {
                setState(() => _start = 60);
                startTimer();
              }
                  : null,
              child: Text(
                "Send Again",
                style: TextStyle(
                  fontSize: responsive.scaleWidth(18),
                  color: _start == 0
                      ? const Color(0xFF1B4332)
                      : AppColors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

