import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/resources/app_assets/app_assets.dart';

class CheckoutFailed extends StatelessWidget {
  const CheckoutFailed({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: responsive.scaleWidth(25),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        shape: Border(
          bottom: BorderSide(
            color: const Color(0xffDEDFDF),
            width: responsive.scaleWidth(1),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(responsive.scaleWidth(50)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: responsive.scaleHeight(90)),
            Image.asset(
              AppAssets.checkOutFailed,
              width: responsive.scaleWidth(283),
              height: responsive.scaleHeight(176),
            ),
            SizedBox(height: responsive.scaleHeight(50)),
            Text(
              "OPS",
              style: TextStyle(
                color: const Color(0xffFF4A4A),
                fontSize: responsive.scaleWidth(24),
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
            SizedBox(height: responsive.scaleHeight(12)),
            Text(
              "Error while confirming your payment/order",
              style: TextStyle(
                color: const Color(0xff656565),
                fontSize: responsive.scaleWidth(16),
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.scaleHeight(80)),
            CustomButton(
              text: "Back",
              onTap: () {},
              color: const Color(0xffFF4A4A),
              textColor: AppColors.white,
            ),
            SizedBox(height: responsive.scaleHeight(20)),
          ],
        ),
      ),
    );
  }
}
