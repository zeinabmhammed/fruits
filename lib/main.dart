import 'package:flutter/material.dart';
import 'package:fruits/features/main_layout/basket/presentation/screen/checkout_failed.dart';
import 'package:fruits/features/main_layout/basket/presentation/screen/checkout_success.dart';
import 'package:fruits/features/main_layout/home/presentation/product_details.dart';
import 'package:fruits/core/routes_manger/routes.dart';
import 'package:fruits/features/auth/presentation/screens/forget_password.dart';
import 'package:fruits/features/auth/presentation/screens/otp_screen.dart';
import 'package:fruits/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:fruits/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:fruits/features/auth/presentation/screens/welcome_screen.dart';
import 'package:fruits/features/main_layout/basket/presentation/screen/basket_screen.dart';
import 'package:fruits/features/main_layout/basket/presentation/screen/checkout_screen.dart';
import 'package:fruits/features/main_layout/favorite/presentation/favorite_screen.dart';
import 'package:fruits/features/main_layout/home/presentation/sellers_details.dart';
import 'package:fruits/features/main_layout/main_layout.dart';
import 'package:fruits/features/main_layout/more/widget/profile_screen.dart';
import 'package:fruits/features/main_layout/more/widget/support_screen.dart';
import 'package:fruits/features/main_layout/more/widget/terms_screen.dart';
import 'package:fruits/features/main_layout/orders/presentation/order_tracking_screen.dart';
import 'package:fruits/features/main_layout/orders/presentation/orders_screen.dart';
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
        AppRoutes.mainLayoutRoute: (context) => const MainLayout(),
        AppRoutes.profileRoute: (context) => const UpdateProfileScreen(),
        AppRoutes.supportRoute: (context) => const SupportScreen(),
        AppRoutes.termsRoute: (context) => const TermsScreen(),
        AppRoutes.sellersDetailsRoute: (context) => const SellersDetails(),
        AppRoutes.ordersRoute: (context) => const OrdersScreen(),
        AppRoutes.favoriteRoute: (context) => const FavoriteScreen(),
        AppRoutes.basketRoute: (context) => const BasketScreen(),
        AppRoutes.checkoutRoute: (context) => const CheckoutScreen(),
        AppRoutes.productDetailsRoute: (context) => const ProductDetails(),
        AppRoutes.checkoutSuccessRoute: (context) => const CheckoutSuccess(),
        AppRoutes.checkoutFailedRoute: (context) => const CheckoutFailed(),
        AppRoutes.orderTrackingRoute: (context) => const OrderTrackingScreen(),
      },

      initialRoute: AppRoutes.splashRoute,
    );
  }
}
