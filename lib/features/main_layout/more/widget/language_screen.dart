import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';

class LanguagePopup {
  static void show(BuildContext context) {
    String selectedOption = "en";

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
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
                        const SizedBox(width: 8),
                        SvgPicture.asset(AppAssets.arabicFlag, height: 20),
                        const SizedBox(width: 8),
                        const Text(
                          "العربية",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff656565),
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
                        const SizedBox(width: 8),
                        SvgPicture.asset(AppAssets.englishFlag, height: 16),
                        const SizedBox(width: 8),
                        const Text(
                          "English",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff656565),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 244,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Center(
                        child: Text(
                          "Close",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff656565),
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
