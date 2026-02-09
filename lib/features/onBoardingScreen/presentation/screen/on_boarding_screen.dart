import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
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
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _currentIndex == _pages.length - 1
                ? SizedBox(height: responsive.scaleHeight(48))
                : _buildSkipButton(responsive),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) =>
                    OnBoardingPages(data: _pages[index]),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                    (index) => DotIndicator(isActive: _currentIndex == index),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(50)),

            _buildNextButton(responsive),
            SizedBox(height: responsive.scaleHeight(140)),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.only(
        right: responsive.scaleWidth(40),
        top: responsive.scaleHeight(20),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () => _controller.jumpToPage(_pages.length - 1),
          child: Text(
            "Skip",
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: responsive.scaleWidth(15),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.scaleWidth(30)),
      child: SizedBox(
        width: responsive.scaleWidth(177),
        height: responsive.scaleHeight(52),
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
              borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
            ),
          ),
          child: Text(
            _currentIndex == _pages.length - 1 ? "Get Started" : "Next",
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: responsive.scaleWidth(18),
            ),
          ),
        ),
      ),
    );
  }
}
