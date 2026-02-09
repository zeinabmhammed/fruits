import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class CustomListCard extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CustomListCard({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: responsive.scaleHeight(105),
        margin: EdgeInsets.symmetric(
          vertical: responsive.scaleHeight(8),
          horizontal: responsive.scaleWidth(16),
        ),
        padding: EdgeInsets.all(responsive.scaleWidth(12)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(responsive.scaleWidth(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: responsive.scaleWidth(5),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: responsive.scaleWidth(80),
              height: responsive.scaleWidth(80),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(responsive.scaleWidth(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: responsive.scaleWidth(6),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(responsive.scaleWidth(50)),
                child: leading,
              ),
            ),
            SizedBox(width: responsive.scaleWidth(12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.scaleWidth(14),
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(4)),
                  if (subtitle != null) ...[
                    SizedBox(height: responsive.scaleHeight(3)),
                    subtitle!,
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
