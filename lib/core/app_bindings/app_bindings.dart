import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';

import '../../screen/auth_screen/login_screen/controller/login_screen_controller.dart';
import '../../screen/auth_screen/otp_screen/controller/otp_screen_controller.dart';
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

    //! Login Screen controller
    Get.lazyPut<LoginScreenController>(() {
      AppLogger.screen("Login Screen");
      return LoginScreenController();
    }, fenix: true);

    //! Otp Screen controller
    Get.lazyPut<OtpScreenController>(() {
      AppLogger.screen("Otp Screen");
      return OtpScreenController();
    }, fenix: true);
  }
}
