import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/features/onBoardingScreen/presentation/widget/on_boarding_model.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPages extends StatelessWidget {
  final OnBoardingData data;

  const OnBoardingPages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
      children: [
        SizedBox(height: responsive.scaleHeight(70)),
        Image.asset(
          data.image,
          height: responsive.height * 0.30,
          fit: BoxFit.contain,
        ),
        SizedBox(height: responsive.scaleHeight(24)),
        Text(
          data.title,
          style: GoogleFonts.poppins(
            fontSize: responsive.isTablet
                ? responsive.scaleWidth(26)
                : responsive.scaleWidth(22),
            fontWeight: FontWeight.bold,
            color: AppColors.darkPurple,
          ),
        ),
        SizedBox(height: responsive.scaleHeight(10)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.scaleWidth(10),
          ),
          child: Text(
            data.subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: responsive.isTablet
                  ? responsive.scaleWidth(20)
                  : responsive.scaleWidth(17),
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
