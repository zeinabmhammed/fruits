import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:fruits/features/auth/presentation/widget/otp_input.dart';
import 'package:fruits/features/auth/presentation/widget/otp_timer.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "Fruit Market",
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Enter Received OTP",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 50),
                const OtpInput(),
                const SizedBox(height: 40),
                CustomButton(
                  text: "Confirm",
                  onTap: () {},
                  color: AppColors.green,
                  textColor: AppColors.white,
                ),
                const SizedBox(height: 40),
                const OtpTimer(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
