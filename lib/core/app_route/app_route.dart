import 'package:get/get.dart';
import 'package:zena_app/screen/auth_screen/otp_screen/otp_screen.dart';
import 'package:zena_app/screen/onboarding_screen/onboarding_screen.dart';

import '../../screen/auth_screen/login_screen/login_screen.dart';
import '../../screen/splash_screen/splash_screen.dart';

class AppRoute {
  AppRoute._();

  static const String splashscreen = '/splashscreen';
  static const String onboardingScreen = "/onboardingScreen";
  static const String loginScreen = "/loginScreen";
  static const String otpScreen = "/otpScreen";



  static final List<GetPage> appRoutes = [
    GetPage(
      name: splashscreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Onboarding Screen
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Login Screen
    GetPage(
      name: loginScreen,
      page: () =>  LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Otp Screen
    GetPage(
      name: otpScreen,
      page: () => OptScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
