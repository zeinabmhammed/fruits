import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:fruits/core/resources/widget/custom_form_field.dart';
import 'package:fruits/core/resources/widget/custom_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                "Login to Wikala",
                style: GoogleFonts.poppins(
                  fontSize: responsive.isTablet
                      ? responsive.scaleWidth(32)
                      : responsive.scaleWidth(28),
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: responsive.scaleHeight(28)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/forgetPassword");
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: const Color(0xFF004D8E),
                        fontSize: responsive.scaleWidth(16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.scaleHeight(20)),
              CustomButton(
                text: " Login ",
                onTap: () {
                  Navigator.pushNamed(context, "/mainLayout");
                },
                color: AppColors.green,
                textColor: AppColors.white,
              ),
              SizedBox(height: responsive.scaleHeight(35)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                      fontSize: responsive.scaleWidth(18),
                      color: AppColors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signUp");
                    },
                    child: Text(
                      "Sign up",
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
