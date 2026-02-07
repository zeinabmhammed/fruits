import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                height: 130,
                width: double.infinity,
                adsImages[currentIndex],
                key: ValueKey<int>(currentIndex),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 169,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: adsImages.map((image) {
                int index = adsImages.indexOf(image);
                return Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? Color(0xFF204F38)
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
