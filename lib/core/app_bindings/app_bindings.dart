import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';

import '../../screen/onboarding_screen/controller/onboarding_screen_controller.dart';
import '../../screen/splash_screen/controller/splash_screen_controller.dart';

class AppInitialBindings extends Bindings {
  @override
  void dependencies() {
    //! Splash Screen controller
    Get.lazyPut<SplashScreenController>(() {
      AppLogger.screen("Splash Screen");
      return SplashScreenController();
    }, fenix: true);

    //! Onboarding Screen controller
    Get.lazyPut<OnboardingScreenController>(() {
      AppLogger.screen("Onboarding Screen");
      return OnboardingScreenController();
    }, fenix: true);
  }
}
