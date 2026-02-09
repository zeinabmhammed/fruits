import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class LanguagePopup {
  static void show(BuildContext context) {
    String selectedOption = "en";
    final responsive = Responsive(context);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsive.scaleWidth(20)),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(responsive.scaleWidth(20)),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(responsive.scaleWidth(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: "ar",
                          groupValue: selectedOption,
                          activeColor: AppColors.green,
                          onChanged: (val) {
                            setState(() {
                              selectedOption = val!;
                            });
                          },
                        ),
                        SizedBox(width: responsive.scaleWidth(8)),
                        SvgPicture.asset(
                          AppAssets.arabicFlag,
                          height: responsive.scaleHeight(20),
                        ),
                        SizedBox(width: responsive.scaleWidth(8)),
                        Text(
                          "العربية",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(16),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff656565),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: "en",
                          groupValue: selectedOption,
                          activeColor: AppColors.green,
                          onChanged: (val) {
                            setState(() {
                              selectedOption = val!;
                            });
                          },
                        ),
                        SizedBox(width: responsive.scaleWidth(8)),
                        SvgPicture.asset(
                          AppAssets.englishFlag,
                          height: responsive.scaleHeight(16),
                        ),
                        SizedBox(width: responsive.scaleWidth(8)),
                        Text(
                          "English",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(16),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff656565),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: responsive.scaleHeight(20)),
                    SizedBox(
                      width: responsive.scaleWidth(244),
                      height: responsive.scaleHeight(44),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(responsive.scaleWidth(25)),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: responsive.scaleHeight(14),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(14),
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: responsive.scaleHeight(12)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: Text(
                          "Close",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(16),
                            color: const Color(0xff656565),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
