import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/splash_screen/controller/splash_screen_controller.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:zena_app/utils/app_images/app_images.dart';
import 'package:zena_app/utils/app_string/app_string.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //!  Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bankgroundImages),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.appImages),
                64.height,

                CommonText(
                  text: AppString.welcometoZena,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.darkColor,
                ),

                12.height,

                CommonText(
                  text: AppString.beautyRewardsMadeEasy,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
