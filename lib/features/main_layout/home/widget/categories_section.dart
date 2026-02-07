import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryItem(AppAssets.restaurant),
          _buildCategoryItem(AppAssets.farm),
          _buildCategoryItem(AppAssets.coffee),
          _buildCategoryItem(AppAssets.pharmacy),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String asset) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 95,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              asset,
            ),
          ),
        ),
        const SizedBox(height: 6),

      ],
    );
  }
}
