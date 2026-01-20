import 'package:get/get.dart';
import 'package:zena_app/screen/onboarding_screen/onboarding_screen.dart';

import '../../screen/splash_screen/splash_screen.dart';

class AppRoute {
  AppRoute._();

  static const String splashscreen = '/splashscreen';
  static const String onboardingScreen = "/onboardingScreen";

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
  ];
}
