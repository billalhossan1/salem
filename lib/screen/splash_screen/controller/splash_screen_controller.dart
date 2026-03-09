import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/services/deep_link_service.dart';
import 'package:zena_app/utils/shared_prefe.dart';

import '../../../core/app_route/app_route.dart';

class SplashScreenController extends GetxController {
  RxDouble animation = 0.0.obs;
  RxDouble animation2 = 0.0.obs;

  Future<void> onInitialDataLoadScreen() async {
    try {
      //! Get saved token
      final String token = await SharePrefsHelper.getString(
        SharedPreferenceValue.token,
      );

      //! Start logo animations shortly after init
      Future.delayed(Durations.medium1, () {
        animation.value = 1.0;
        animation2.value = 1.0;
      });

      //! Wait 3 seconds then navigate
      Future.delayed(const Duration(seconds: 3), () async {
        //! Check for a pending deep link
        final deepLinkService = DeepLinkService.instance;
        final pendingPath = deepLinkService.pendingPath.value;

        if (pendingPath.isNotEmpty && token.isNotEmpty) {
          //! Authenticated + deep link → handle it
          AppLogger.debug(
            'Navigating via deep link path: "$pendingPath"',
            tag: 'Splash',
          );
          deepLinkService.clearPending();
          Get.offAllNamed(AppRoute.bottomNav);
          // Add extra routing based on pendingPath here if needed.
        } else if (token.isNotEmpty) {
          //! Authenticated, no deep link
          Get.offAllNamed(AppRoute.bottomNav);
        } else {
          //! Not authenticated
          Get.offAllNamed(AppRoute.onboardingScreen);
        }
      });
    } catch (e) {
      AppLogger.error('onInitialDataLoadScreen error: $e', tag: 'Splash');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(AppRoute.onboardingScreen);
      });
    }
  }

  @override
  void onInit() {
    onInitialDataLoadScreen();
    super.onInit();
  }
}
