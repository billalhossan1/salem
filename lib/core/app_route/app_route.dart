import 'package:get/get.dart';

import '../../screen/splash_screen/splash_screen.dart';

class AppRoute {
  AppRoute._();

  static const String splashscreen = '/splashscreen';

  static final List<GetPage> appRoutes = [
    GetPage(
      name: splashscreen,
      page: () =>  SplashScreen(),
    ),
    // Add other routes here
  ];
}