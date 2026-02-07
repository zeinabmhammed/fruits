import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/widget/Custom_Text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: Border(bottom: BorderSide(color: Color(0xffDEDFDF), width: 1)),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(text: "Name", controller: nameController),
            const SizedBox(height: 16),
            CustomTextField(text: "Mobile Number", controller: phoneController),
            const SizedBox(height: 16),
            CustomTextField(
              text: "Message",
              controller: messageController,
              maxLines: 4,
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 27),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.whatsapp, height: 40),
                const SizedBox(width: 16),
                SvgPicture.asset(AppAssets.faceIcon, height: 40),
                const SizedBox(width: 16),
                SvgPicture.asset(AppAssets.instagram, height: 40),
                const SizedBox(width: 16),
                SvgPicture.asset(AppAssets.youtube, height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
