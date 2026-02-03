import 'package:get/get.dart';

import '../../../core/app_route/app_route.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 2200));
    Get.offNamed(AppRoute.onboardingScreen);
  }
}
