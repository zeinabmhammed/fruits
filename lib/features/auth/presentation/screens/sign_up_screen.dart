import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/custom_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/resources/widget/custom_elevated_button.dart';
import '../../../../core/resources/widget/custom_phone_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.scaleWidth(30),
          ),
          child: Column(
            children: [
              SizedBox(height: responsive.scaleHeight(25)),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: responsive.scaleWidth(28),
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: responsive.scaleHeight(65)),
              Text(
                "Fruit Market",
                style: GoogleFonts.poppins(
                  fontSize: responsive.isTablet
                      ? responsive.scaleWidth(48)
                      : responsive.scaleWidth(42),
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
              SizedBox(height: responsive.scaleHeight(21)),
              Text(
                "Sign Up to Wikala",
                style: GoogleFonts.poppins(
                  fontSize: responsive.isTablet
                      ? responsive.scaleWidth(32)
                      : responsive.scaleWidth(28),
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: responsive.scaleHeight(28)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Full name ",
                    style: TextStyle(
                      fontSize: responsive.scaleWidth(14),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF858D9A),
                    ),
                  ),
                ],
              ),
              CustomFormField(
                hintText: "First and Last Name",
                isPassword: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                controller: TextEditingController(),
              ),
              SizedBox(height: responsive.scaleHeight(10)),
              CustomPhoneField(),
              SizedBox(height: responsive.scaleHeight(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: responsive.scaleWidth(14),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF858D9A),
                    ),
                  ),
                ],
              ),
              CustomFormField(
                hintText: "Enter your password",
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                controller: TextEditingController(),
              ),
              SizedBox(height: responsive.scaleHeight(20)),
              CustomButton(
                text: " Sign Up",
                onTap: () {},
                color: AppColors.green,
                textColor: AppColors.white,
              ),
              SizedBox(height: responsive.scaleHeight(35)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: responsive.scaleWidth(18),
                      color: AppColors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signIn");
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: const Color(0xFF004D8E),
                        fontSize: responsive.scaleWidth(18),
                      ),
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
