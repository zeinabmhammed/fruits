import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:fruits/core/resources/widget/custom_form_field.dart';
import 'package:fruits/core/resources/widget/custom_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                "Login to Wikala",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 28),
              CustomPhoneField(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF858D9A),
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
                      style: TextStyle(color: Color(0xFF004D8E), fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                text: " Login ",
                onTap: () {},
                color: AppColors.green,
                textColor: AppColors.white,
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(fontSize: 18, color: AppColors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signUp");
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Color(0xFF004D8E), fontSize: 18),
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
