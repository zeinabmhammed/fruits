import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'basket/presentation/screen/basket_screen.dart';
import 'favorite/presentation/favorite_screen.dart';
import 'home/presentation/home_screen.dart';
import 'more/presentation/more_screen.dart';
import 'orders/presentation/orders_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const OrdersScreen(),
    const BasketScreen(),
    const FavoriteScreen(),
    const MoreScreen(),
  ];

  final List<String> _titles = ["Home", "Orders", "Basket", "Favorite", "More"];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: Container(
        height: responsive.scaleHeight(75),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(responsive.scaleWidth(20)),
            topRight: Radius.circular(responsive.scaleWidth(20)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(AppAssets.homeIcon, 0, responsive),
            _buildNavItem(AppAssets.ordersIcon, 1, responsive),
            _buildNavItem(AppAssets.basketIcon, 2, responsive),
            _buildNavItem(AppAssets.favoriteIcon, 3, responsive),
            _buildNavItem(AppAssets.moreIcon, 4, responsive),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String asset, int index, Responsive responsive) {
    final bool isActive = _currentIndex == index;

    if (isActive) {
      return GestureDetector(
        onTap: () => setState(() => _currentIndex = index),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.scaleWidth(14),
            vertical: responsive.scaleHeight(6),
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(responsive.scaleWidth(20)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                asset,
                color: AppColors.green,
                height: responsive.scaleHeight(25),
              ),
              SizedBox(width: responsive.scaleWidth(6)),
              Text(
                _titles[index],
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: responsive.scaleWidth(12),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => setState(() => _currentIndex = index),
        child: SvgPicture.asset(
          asset,
          color: AppColors.white,
          height: responsive.scaleHeight(26),
        ),
      );
    }
  }
}
