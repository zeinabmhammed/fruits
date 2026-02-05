import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:fruits/features/auth/presentation/widget/otp_timer.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 25),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 33,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 65),
              Text(
                "Fruit Market",
                style: GoogleFonts.poppins(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
              SizedBox(height: 21),
              Text(
                "Enter Received OTP",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 50),
              OtpScreen(),
              SizedBox(height: 50),
              CustomButton(
                text: "Confirm",
                onTap: () {},
                color: AppColors.green,
                textColor: AppColors.white,
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [OtpTimer()],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not received? ",
                    style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Send Again",
                      style: TextStyle(color: Color(0xFF235C95), fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
