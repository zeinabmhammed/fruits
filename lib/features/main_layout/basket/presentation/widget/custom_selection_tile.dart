import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class CustomSelectionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final IconData? icon;

  const CustomSelectionTile({
    super.key,
    required this.title,
    this.isSelected = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      padding: EdgeInsets.all(responsive.scaleWidth(15)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(responsive.scaleWidth(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: responsive.scaleWidth(16),
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            isSelected ? Icons.circle_outlined : Icons.circle,
            size: responsive.scaleWidth(20),
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}

