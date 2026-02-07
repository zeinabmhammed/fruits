import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
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
    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(AppAssets.homeIcon, 0),
            _buildNavItem(AppAssets.ordersIcon, 1),
            _buildNavItem(AppAssets.basketIcon, 2),
            _buildNavItem(AppAssets.favoriteIcon, 3),
            _buildNavItem(AppAssets.moreIcon, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String asset, int index) {
    final bool isActive = _currentIndex == index;

    if (isActive) {
      return GestureDetector(
        onTap: () => setState(() => _currentIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              SvgPicture.asset(asset, color: AppColors.green, height: 25),
              const SizedBox(width: 6),
              Text(
                _titles[index],
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 12,
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
        child: SvgPicture.asset(asset, color: AppColors.white, height: 26),
      );
    }
  }
}
