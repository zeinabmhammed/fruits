import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: responsive.scaleHeight(12),
      width: isActive ? responsive.scaleWidth(15) : responsive.scaleWidth(10),
      margin: EdgeInsets.only(right: responsive.scaleWidth(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsive.scaleWidth(20)),
        border: Border.all(color: AppColors.green),
        color: isActive ? AppColors.green : AppColors.white,
      ),
    );
  }
}
