import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:google_fonts/google_fonts.dart';


class CheckoutSuccess extends StatelessWidget {
  const CheckoutSuccess({super.key});

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
        padding: EdgeInsets.all(responsive.scaleWidth(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: responsive.scaleHeight(60)),
            Image.asset(
              AppAssets.checkOutSuccess,
              width: responsive.scaleWidth(283),
              height: responsive.scaleHeight(176),
            ),
            SizedBox(height: responsive.scaleHeight(40)),
            Text(
              "YOUR ORDER IS CONFIRMED!",
              style: TextStyle(
                color: AppColors.green,
                fontSize: responsive.scaleWidth(24),
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.scaleHeight(10)),
            Text(
              "Your order code: #243188",
              style: TextStyle(
                color: const Color(0xff656565),
                fontSize: responsive.scaleWidth(20),
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.scaleHeight(5)),
            Text(
              "Thank you for choosing our products!",
              style: TextStyle(
                color: const Color(0xff656565),
                fontSize: responsive.scaleWidth(18),
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: responsive.scaleHeight(30)),
            CustomButton(
              text: "Continue Shopping",
              onTap: () {},
              color: AppColors.green,
              textColor: AppColors.white,
            ),
            SizedBox(height: responsive.scaleHeight(20)),
            CustomButton(
              text: "Track Order",
              onTap: () {},
              color: Colors.white,
              textColor: AppColors.green,
            ),
          ],
        ),
      ),
    );
  }
}
