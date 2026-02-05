import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/features/onBoardingScreen/presentation/screen/on_boarding_pages_screen.dart';
import 'package:fruits/features/onBoardingScreen/presentation/widget/dot_indicator.dart';
import 'package:fruits/features/onBoardingScreen/presentation/widget/on_boarding_model.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<OnBoardingData> _pages = [
    OnBoardingData(
      title: "E Shopping",
      subTitle: "Explore top organic fruits & grab them",
      image: AppAssets.onBoardingScreen,
    ),
    OnBoardingData(
      title: "Delivery Arrived",
      subTitle: "Order is arrived at your Place",
      image: AppAssets.onBoardingScreen,
    ),
    OnBoardingData(
      title: "Delivery Arrived",
      subTitle: "Order is arrived at your Place",
      image: AppAssets.onBoardingScreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _currentIndex == _pages.length - 1
                ? const SizedBox(height: 48)
                : _buildSkipButton(),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) =>
                    OnBoardingPages(data: _pages[index]),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => DotIndicator(isActive: _currentIndex == index),
              ),
            ),
            const SizedBox(height: 100),

            _buildNextButton(),
            const SizedBox(height: 145),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 40, top: 20),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () => _controller.jumpToPage(_pages.length - 1),
          child: Text(
            "Skip",
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: 177,
        height: 52,
        child: ElevatedButton(
          onPressed: () {
            if (_currentIndex < _pages.length - 1) {
              _controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              Navigator.pushNamed(context, "/welcome");
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text(
            _currentIndex == _pages.length - 1 ? "Get Started" : "Next",
            style: GoogleFonts.poppins(color: AppColors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
