import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:fruits/core/resources/widget/custom_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                "Enter your Number",
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
              SizedBox(height: responsive.scaleHeight(48)),
              CustomButton(
                text: "Submit",
                onTap: () {
                  Navigator.pushNamed(context, "/otp");
                },
                color: AppColors.green,
                textColor: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
