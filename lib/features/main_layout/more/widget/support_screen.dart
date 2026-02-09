import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/Custom_Text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
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
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(responsive.scaleWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(text: "Name", controller: nameController),
            SizedBox(height: responsive.scaleHeight(16)),
            CustomTextField(text: "Mobile Number", controller: phoneController),
            SizedBox(height: responsive.scaleHeight(16)),
            CustomTextField(
              text: "Message",
              controller: messageController,
              maxLines: 4,
            ),
            SizedBox(height: responsive.scaleHeight(20)),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.scaleWidth(30),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        responsive.scaleWidth(25),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: responsive.scaleHeight(14),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: responsive.scaleWidth(18),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(27)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.whatsapp,
                  height: responsive.scaleHeight(40),
                ),
                SizedBox(width: responsive.scaleWidth(16)),
                SvgPicture.asset(
                  AppAssets.faceIcon,
                  height: responsive.scaleHeight(40),
                ),
                SizedBox(width: responsive.scaleWidth(16)),
                SvgPicture.asset(
                  AppAssets.instagram,
                  height: responsive.scaleHeight(40),
                ),
                SizedBox(width: responsive.scaleWidth(16)),
                SvgPicture.asset(
                  AppAssets.youtube,
                  height: responsive.scaleHeight(40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
