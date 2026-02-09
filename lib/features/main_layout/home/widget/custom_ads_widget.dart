import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class CustomAdsWidget extends StatelessWidget {
  final List<String> adsImages;
  final int currentIndex;
  final Timer timer;

  const CustomAdsWidget({
    super.key,
    required this.adsImages,
    required this.currentIndex,
    required this.timer,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.scaleWidth(16)),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
              child: Image.asset(
                adsImages[currentIndex],
                key: ValueKey<int>(currentIndex),
                height: responsive.scaleHeight(130),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: responsive.scaleHeight(169),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: adsImages.map((image) {
                int index = adsImages.indexOf(image);
                return Container(
                  width: responsive.scaleWidth(8),
                  height: responsive.scaleWidth(8),
                  margin: EdgeInsets.symmetric(
                    horizontal: responsive.scaleWidth(4),
                    vertical: responsive.scaleHeight(12),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? const Color(0xFF204F38)
                        : AppColors.white,
                    border: Border.all(color: AppColors.green),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
