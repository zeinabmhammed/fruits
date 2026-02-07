import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/features/main_layout/home/widget/categories_section.dart';
import 'package:fruits/features/main_layout/home/widget/custom_ads_widget.dart';
import 'package:fruits/features/main_layout/home/widget/filter_popup.dart';
import 'package:fruits/features/main_layout/home/widget/sellers_section.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    AppAssets.adsOne,
    AppAssets.adsTwo,
    AppAssets.adsThree,
    AppAssets.adsFour,
  ];
  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Fruit Market",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.searchIcon, width: 26),
          ),
          IconButton(
            onPressed: () {
              FilterPopup.show(context);
            },
            icon: SvgPicture.asset(AppAssets.filterIcon, width: 26),
          ),
          const SizedBox(width: 10),
        ],
        shape: Border(bottom: BorderSide(color: Color(0xffDEDFDF), width: 1)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            CustomAdsWidget(
              adsImages: adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            SizedBox(height: 15),
            CategoriesSection(),
            SizedBox(height: 16),
            SellersSection(),
          ],
        ),
      ),
    );
  }
}
