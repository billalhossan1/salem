import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zena_app/screen/home_screen/controller/home_screen_controller.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';
import 'package:get/get.dart';

class HowItWorkPointsScreen extends StatelessWidget {
  const HowItWorkPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find<HomeScreenController>();
    String secondaryHex =
        '#${AppColor.secondaryColor.value.toRadixString(16).substring(2)}';
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "How it Works".tr,
        leadingType: LeadingType.back,
        centerTitle: true,
        // actions: [
        //   NotificationActionButton(
        //     notificationCount: 3,
        //     onTap: () => Get.toNamed(AppRoute.notificationScreen),
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            40.height,
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.rewardsIcons,
                  colorFilter: ColorFilter.mode(
                    AppColor.secondaryColor,
                    BlendMode.srcIn,
                  ),
                  width: 32.w,
                ),
              ),
            ),
            24.height,
            CommonText(
              text: "Every Visit Brings You Closer ✨".tr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              textColor: AppColor.darkColor,
            ),
            32.height,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _buildBulletPoint('<span>Every visit = <span style="color: $secondaryHex; font-weight: 900;">100</span> points</span>'.tr,homeScreenController.savedLang),
                  8.height,
                  _buildBulletPoint('<span><span style="color: $secondaryHex; font-weight: 900;">4</span> visits = 1 lovely reward</span>'.tr,homeScreenController.savedLang),
                  8.height,

                  _buildBulletPoint(
                    '<span><span style="color: $secondaryHex; font-weight: 900;">3</span> visits within <span style="color: $secondaryHex; font-weight: 900;">30</span> days at the same salon = faster bonus ✨</span>'.tr,homeScreenController.savedLang
                  ),

                ],
              ),
            ),
            Spacer(),
            CommonText(
              text:
                  "Visit your favourite salon, enjoy your time, and feel the joy add up beautifully.".tr,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: AppColor.textColor,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            24.height,
            CommonButton(
              titleText: "Explore Salons".tr,
              onTap: () {
                // Navigate to explore salons
              },
              buttonColor: AppColor.primaryColor,
              titleColor: AppColor.darkColor,
              buttonRadius: 12,
              buttonWidth: double.infinity,
            ),
            40.height,
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text,String language) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "•".tr,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          textColor: AppColor.darkColor,
        ),
        8.width,
        Expanded(
          child: CommonText(
            isDescription: true,
            text: text,
            fontSize: 16.sp,
            overflow: .visible,
            fontWeight: FontWeight.w400,
            textColor: AppColor.darkColor,
            maxLines: 3,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
