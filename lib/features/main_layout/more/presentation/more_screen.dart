import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/features/main_layout/more/widget/language_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Fruit Market",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: Icon(Icons.arrow_back_ios_new, color: AppColors.black),
        shape: Border(bottom: BorderSide(color: Color(0xffDEDFDF), width: 1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xff9EA4AE), width: 2),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.profileIcon,
                  height: 50,
                  color: Color(0xff9EA4AE),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Welcome, Fruit Market",
              style: TextStyle(fontSize: 24, color: AppColors.black),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 347,
              height: 51,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/signIn");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: const [
                  MoreOptionItem(icon: AppAssets.profileIcon, title: "Profile"),
                  MoreOptionItem(
                    icon: AppAssets.ordersIcon,
                    title: "My Orders",
                  ),
                  MoreOptionItem(
                    icon: AppAssets.favoriteIcon,
                    title: "Favorite",
                  ),
                  MoreOptionItem(
                    icon: AppAssets.languageIcon,
                    title: "Language",
                  ),
                  MoreOptionItem(icon: AppAssets.supportIcon, title: "Support"),
                  MoreOptionItem(
                    icon: AppAssets.termsIcon,
                    title: "Terms & Conditions",
                  ),
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      leading: SvgPicture.asset(icon, height: 25, color: AppColors.green),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        if (title == "Language") {
          LanguagePopup.show(context);
        } else if (title == "Support") {
          Navigator.pushNamed(context, "/support");

        } else if (title == "Terms & Conditions") {
          Navigator.pushNamed(context, "/terms");
        }
        else if (title == "Profile") {
          Navigator.pushNamed(context, "/profile");
        }
        else if (title == "My Orders") {
          Navigator.pushNamed(context, "/orders");
        }
        else if (title == "Favorite") {
          Navigator.pushNamed(context, "/favorite");
        }
        else if (title == "About Us") {
          Navigator.pushNamed(context, "/about");
        }
      },
    );
  }
}
