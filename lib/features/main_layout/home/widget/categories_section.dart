import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.scaleWidth(16),
        vertical: responsive.scaleHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryItem(AppAssets.restaurant, responsive),
          _buildCategoryItem(AppAssets.farm, responsive),
          _buildCategoryItem(AppAssets.coffee, responsive),
          _buildCategoryItem(AppAssets.pharmacy, responsive),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String asset, Responsive responsive) {
    return Column(
      children: [
        Container(
          width: responsive.scaleWidth(80),
          height: responsive.scaleHeight(85),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: responsive.scaleWidth(6),
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
            child: Image.asset(asset),
          ),
        ),
        SizedBox(height: responsive.scaleHeight(6)),
      ],
    );
  }
}
