import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/custom_primary_Button.dart';
import 'package:fruits/features/main_layout/orders/widget/TrackingVerticalStepper.dart';
import 'package:fruits/features/main_layout/orders/widget/cancel_order.dart';
import 'package:fruits/features/main_layout/orders/widget/order_info_section.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Order Tracking",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.black, size: responsive.scaleWidth(25)),
          onPressed: () => Navigator.pop(context),
        ),
        shape: Border(
          bottom: BorderSide(
            color: const Color(0xffDEDFDF),
            width: responsive.scaleWidth(2),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(responsive.scaleWidth(30)),
        child: Column(
          children: [
            const OrderInfoSection(),
            SizedBox(height: responsive.scaleHeight(20)),
            const TrackingVerticalStepper(),
            SizedBox(height: responsive.scaleHeight(30)),
            CustomPrimaryButton(text: "Confirm", onPressed: () {}),
            SizedBox(height: responsive.scaleHeight(10)),
            SizedBox(
              width: responsive.scaleWidth(347),
              height: responsive.scaleHeight(51),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: () => _showCancelDialog(context),
                child: Text(
                  "Cancel Order",
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(18),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CancelOrderPopup(),
    );
  }
}
