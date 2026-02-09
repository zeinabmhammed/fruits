import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/features/main_layout/more/widget/language_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Fruit Market",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.black,
          size: responsive.scaleWidth(22),
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
        child: Column(
          children: [
            SizedBox(height: responsive.scaleHeight(20)),
            Container(
              width: responsive.scaleWidth(100),
              height: responsive.scaleWidth(100),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff9EA4AE),
                  width: responsive.scaleWidth(2),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.profileIcon,
                  height: responsive.scaleHeight(50),
                  color: const Color(0xff9EA4AE),
                ),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(12)),
            Text(
              "Welcome, Fruit Market",
              style: TextStyle(
                fontSize: responsive.scaleWidth(22),
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: responsive.scaleHeight(12)),
            SizedBox(
              width: responsive.scaleWidth(340),
              height: responsive.scaleHeight(45),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/signIn");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      responsive.scaleWidth(25),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.scaleWidth(40),
                    vertical: responsive.scaleHeight(12),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(16),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(20)),
            Expanded(
              child: ListView(
                children: const [
                  MoreOptionItem(icon: AppAssets.profileIcon, title: "Profile"),
                  MoreOptionItem(icon: AppAssets.ordersIcon, title: "My Orders"),
                  MoreOptionItem(icon: AppAssets.favoriteIcon, title: "Favorite"),
                  MoreOptionItem(icon: AppAssets.languageIcon, title: "Language"),
                  MoreOptionItem(icon: AppAssets.supportIcon, title: "Support"),
                  MoreOptionItem(icon: AppAssets.termsIcon, title: "Terms & Conditions"),
                  MoreOptionItem(icon: AppAssets.aboutIcon, title: "About Us"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreOptionItem extends StatelessWidget {
  final String icon;
  final String title;

  const MoreOptionItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: responsive.scaleWidth(10),
        vertical: responsive.scaleHeight(5),
      ),
      leading: SvgPicture.asset(
        icon,
        height: responsive.scaleHeight(25),
        color: AppColors.green,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: responsive.scaleWidth(16)),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: responsive.scaleWidth(16),
        color: Colors.grey,
      ),
      onTap: () {
        if (title == "Language") {
          LanguagePopup.show(context);
        } else if (title == "Support") {
          Navigator.pushNamed(context, "/support");
        } else if (title == "Terms & Conditions") {
          Navigator.pushNamed(context, "/terms");
        } else if (title == "Profile") {
          Navigator.pushNamed(context, "/profile");
        } else if (title == "My Orders") {
          Navigator.pushNamed(context, "/orders");
        } else if (title == "Favorite") {
          Navigator.pushNamed(context, "/favorite");
        } else if (title == "About Us") {
          Navigator.pushNamed(context, "/about");
        }
      },
    );
  }
}
