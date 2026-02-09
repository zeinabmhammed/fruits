import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                  iconSize: responsive.scaleWidth(24),
                ),
              ),
              SizedBox(height: responsive.scaleHeight(65)),
              Text(
                "Fruit Market",
                style: GoogleFonts.poppins(
                  fontSize: responsive.isTablet
                      ? responsive.scaleWidth(48)
                      : responsive.scaleWidth(40),
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
              SizedBox(height: responsive.scaleHeight(21)),
              Text(
                "Welcome to Our app",
                style: GoogleFonts.poppins(
                  fontSize: responsive.isTablet
                      ? responsive.scaleWidth(32)
                      : responsive.scaleWidth(28),
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: responsive.scaleHeight(52)),
              CustomButton(
                text: "Sign in with Phone Number",
                iconPath: AppAssets.phoneIcon,
                onTap: () {},
              ),
              SizedBox(height: responsive.scaleHeight(21)),
              CustomButton(
                text: "Sign in with Google",
                iconPath: AppAssets.googleIcon,
                onTap: () {},
              ),
              SizedBox(height: responsive.scaleHeight(21)),
              CustomButton(
                text: "Sign in with Facebook",
                iconPath: AppAssets.facebookIcon,
                color: const Color(0xFF4267B2),
                textColor: Colors.white,
                onTap: () {},
              ),
              SizedBox(height: responsive.scaleHeight(70)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already member? ",
                    style: GoogleFonts.poppins(
                      fontSize: responsive.scaleWidth(18),
                      color: AppColors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signIn");
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF004D8E),
                        fontSize: responsive.scaleWidth(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.scaleHeight(47)),
              Text(
                "By continue you agree to our Terms of service and our Privacy Policy",
                style: GoogleFonts.poppins(
                  fontSize: responsive.scaleWidth(14),
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
