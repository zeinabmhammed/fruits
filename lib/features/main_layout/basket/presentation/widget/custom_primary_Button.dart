import 'package:flutter/material.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return SizedBox(
      width: responsive.scaleWidth(340),
      height: responsive.scaleHeight(50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2D5E42),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: responsive.scaleWidth(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
