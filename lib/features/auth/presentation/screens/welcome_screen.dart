import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
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
                "Welcome to Our app",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 52),
              CustomButton(
                text: "Sign in with Phone Number",
                iconPath: AppAssets.phoneIcon,
                onTap: () {},
              ),
              const SizedBox(height: 21),
              CustomButton(
                text: "Sign in with Google",
                iconPath: AppAssets.googleIcon,
                onTap: () {},
              ),
              const SizedBox(height: 21),
              CustomButton(
                text: "Sign in with Facebook",
                iconPath: AppAssets.facebookIcon,
                color: const Color(0xFF4267B2),
                textColor: Colors.white,
                onTap: () {},
              ),
              SizedBox(height: 80,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(
                      "Already member? ",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signIn");
                    },
                    child:  Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF004D8E),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Text("By continue you agree to ourTerms of service"" \n and ourPrivacy Policy",
                style:GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey, ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
