import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? iconPath;
  final Color? iconColor;
  final Color? color;
  final Color? textColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? iconSize;


  const CustomButton({
    super.key,
    required this.text,
    this.iconPath,
    this.color,
    this.textColor,
    required this.onTap,
    this.iconColor,
    this.width,
    this.height,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath ?? "", height: 20),
            SizedBox(width: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? Color(0xFF242729),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
