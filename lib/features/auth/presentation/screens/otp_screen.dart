import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:fruits/features/auth/presentation/widget/otp_input.dart';
import 'package:fruits/features/auth/presentation/widget/otp_timer.dart';
import 'package:google_fonts/google_fonts.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: responsive.scaleWidth(28),
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(40)),
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
                SizedBox(height: responsive.scaleHeight(20)),
                Text(
                  "Enter Received OTP",
                  style: GoogleFonts.poppins(
                    fontSize: responsive.isTablet
                        ? responsive.scaleWidth(28)
                        : responsive.scaleWidth(24),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(50)),
                const OtpInput(),
                SizedBox(height: responsive.scaleHeight(40)),
                CustomButton(
                  text: "Confirm",
                  onTap: () {},
                  color: AppColors.green,
                  textColor: AppColors.white,
                ),
                SizedBox(height: responsive.scaleHeight(40)),
                const OtpTimer(),
                SizedBox(height: responsive.scaleHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
