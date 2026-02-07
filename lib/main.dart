import 'package:flutter/material.dart';
import 'package:fruits/core/routes_manger/routes.dart';
import 'package:fruits/features/auth/presentation/screens/forget_password.dart';
import 'package:fruits/features/auth/presentation/screens/otp_screen.dart';
import 'package:fruits/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:fruits/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:fruits/features/auth/presentation/screens/welcome_screen.dart';
import 'package:fruits/features/main_layout/main_layout.dart';
import 'package:fruits/features/main_layout/more/widget/profile_screen.dart';
import 'package:fruits/features/onBoardingScreen/presentation/screen/on_boarding_screen.dart';
import 'package:fruits/features/splash_screen/presentation/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.splashRoute: (context) => const SplashScreen(),
        AppRoutes.onBoardingRoute: (context) => const OnBoardingScreen(),
        AppRoutes.welcomeRoute: (context) => const WelcomeScreen(),
        AppRoutes.signInRoute: (context) => const SignInScreen(),
        AppRoutes.signUpRoute: (context) => const SignUpScreen(),
        AppRoutes.forgetPasswordRoute: (context) => const ForgetPassword(),
        AppRoutes.otpRoute: (context) => const OtpScreen(),
        AppRoutes.mainLayoutRoute : (context) => const MainLayout(),
        AppRoutes.profileRoute : (context) => const UpdateProfileScreen(),

      },

      initialRoute: AppRoutes.splashRoute,
    );
  }
}
