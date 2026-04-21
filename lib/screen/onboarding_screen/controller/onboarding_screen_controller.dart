import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/utils/app_images/app_images.dart';
import 'package:zena_app/utils/app_string/app_string.dart';

class OnboardingScreenController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  RxBool isNextPressed = false.obs;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppImages.onboarding1,
      "title": AppString.onBoardingTitle01.tr,
      "subtitle": AppString.onBoardingSubTitle01.tr,
    },
    {
      "image": AppImages.onboarding2,
      "title": AppString.onBoardingTitle02.tr,
      "subtitle": AppString.onBoardingSubTitle02.tr,
    },
    {
      "image": AppImages.onboarding3,
      "title": AppString.onBoardingTitle03.tr,
      "subtitle": AppString.onBoardingSubTitle03.tr,
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Get.offAllNamed(AppRoute.loginScreen);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
