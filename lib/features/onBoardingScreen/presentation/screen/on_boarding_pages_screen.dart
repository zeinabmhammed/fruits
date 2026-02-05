import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/features/onBoardingScreen/presentation/widget/on_boarding_model.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPages extends StatelessWidget {
  final OnBoardingData data;

  const OnBoardingPages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const SizedBox(height: 70),
        Image.asset(
          data.image,
          height: screenHeight * 0.30,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 24),
        Text(
          data.title,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.darkPurple,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            data.subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 17, color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
