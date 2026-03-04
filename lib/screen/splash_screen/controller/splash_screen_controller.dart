import 'package:get/get.dart';
import 'package:zena_app/utils/shared_prefe.dart';

import '../../../core/app_route/app_route.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 2200));
    final String token = await SharePrefsHelper.getString(SharedPreferenceValue.token);
    if(token.isNotEmpty){
      Get.offAllNamed(AppRoute.bottomNav);
    }else{
      Get.offNamed(AppRoute.onboardingScreen);
    }

  }
}
