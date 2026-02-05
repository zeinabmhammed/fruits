import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/features/onBoardingScreen/presentation/screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          AppAssets.splashScreen,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}