import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) => _buildOtpBox(context, index == 0)),
    );
  }

  Widget _buildOtpBox(BuildContext context, bool first) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        autofocus: first,
        onChanged: (value) {
          if (value.length == 1) FocusScope.of(context).nextFocus();
          if (value.isEmpty) FocusScope.of(context).previousFocus();
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF9F9F9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFF929292)),
          ),
        ),
      ),
    );
  }
}
