import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: isActive ? 15 : 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.green),
        color: isActive ? AppColors.green : AppColors.white,
      ),
    );
  }
}