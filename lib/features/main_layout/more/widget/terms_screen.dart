import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    const termsText = """
A Terms and Conditions agreement acts as a legal contract between you (the company) and the user.
It’s where you maintain your rights to exclude users from your app in the event that they abuse your website/app, set rules for using your service and note other important details and disclaimers.

Having a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching GDPR.

Your Terms and Conditions agreement will be uniquely yours. While some clauses are standard and commonly seen in pretty much every Terms and Conditions agreement, it’s up to you to set the rules and guidelines that the user must agree to.

Terms and Conditions agreements are also known as Terms of Service or Terms of Use agreements.
""";

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Terms and Conditions",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: responsive.scaleWidth(25),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: Border(
          bottom: BorderSide(
            color: const Color(0xffDEDFDF),
            width: responsive.scaleWidth(2),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(responsive.scaleWidth(16)),
        child: SingleChildScrollView(
          child: Text(
            termsText,
            style: TextStyle(
              fontSize: responsive.scaleWidth(18),
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
