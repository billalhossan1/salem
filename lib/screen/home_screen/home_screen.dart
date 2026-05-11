import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/screen/home_screen/controller/home_screen_controller.dart';
import 'package:zena_app/screen/profile_screen/controller/profile_screen_controller.dart';
import 'package:zena_app/widget/app_custom_appbar/app_custom_appbar.dart';
import 'package:zena_app/widget/app_custom_cards/home_screen_card.dart';
import 'package:zena_app/widget/notificaiton_widget/notification_widget.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/shimmer/app_shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    final profileController = Get.find<ProfileScreenController>();

    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Home".tr,
        leadingType: LeadingType.logo,
        centerTitle: true,
        actions: [NotificationWidget()],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            10.height,
            //! Treat You Self More.
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.howItWorkPointsScreen);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: AppColor.secondaryColor.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [
                    BoxShadow(
                      color: AppColor.secondaryColor.withValues(alpha: 0.03),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Treat yourself more 💕".tr,
                      fontSize: 16.w,
                      fontWeight: FontWeight.w600,
                      textColor: AppColor.darkColor,
                    ),
                    4.height,
                    CommonText(
                      text: "Every visit = 100 points".tr,
                      fontSize: 12.w,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.textColor,
                    ),
                    12.height,
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.starIcons),
                        6.width,
                        Obx(
                          () => CommonText(
                            text: controller.savedLang == 'en'
                                ? "${profileController.profileModel.value.coins}/400"
                                      .tr
                                : "400/${profileController.profileModel.value.coins}",
                            fontSize: 24.w,
                            fontWeight: FontWeight.w600,
                            textColor: AppColor.darkColor,
                          ),
                        ),
                      ],
                    ),
                    16.height,
                    Obx(
                      () => Container(
                        height: 12.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.whiteColor,
                        ),
                        child: FractionallySizedBox(
                          alignment: controller.savedLang == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          widthFactor:
                              (profileController.profileModel.value.coins / 400)
                                  .clamp(0.0, 1.0), // 70% progress
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    12.height,
                    Obx(
                      () => CommonText(
                        text: profileController.profileModel.value.coins < 100
                            ? "A beautiful start ✨ Your first step to glowing rewards has begun 💖"
                                  .tr
                            : profileController.profileModel.value.coins < 200
                            ? "You’re getting closer 🌸 Just a few more visits to unlock your reward 🎁"
                                  .tr
                            : profileController.profileModel.value.coins < 300
                            ? "You’re halfway there ✨ Keep treating yourself, you’re getting close 💕"
                                  .tr
                            : "You’re so close 😍 Just one more step and your reward is yours 🎁"
                                  .tr,
                        fontSize: 12.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            16.height,

            //! Invite Friends.
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.howItWorkInviteScreen);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0xFFB08AB1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x4C9C6BC3),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Invite 3 Friends".tr,
                      fontSize: 16.w,
                      fontWeight: FontWeight.w500,
                      textColor: AppColor.screenBackgroundColor,
                    ),
                    12.height,
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.starIcons),
                        08.width,
                        Obx(
                          () => CommonText(
                            text: controller.savedLang == 'en'
                                ? "${profileController.profileModel.value.successfulInvites}/3"
                                      .tr
                                : "3/${profileController.profileModel.value.successfulInvites}"
                                      .tr,
                            fontSize: 24.w,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.screenBackgroundColor,
                          ),
                        ),
                        06.width,
                        CommonText(
                          text: "Points".tr,
                          fontSize: 20.w,
                          fontWeight: FontWeight.w500,
                          textColor: AppColor.screenBackgroundColor,
                        ),
                      ],
                    ),
                    32.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100.w,
                          height: 12.h,
                          decoration: ShapeDecoration(
                            // color: const Color(0xFFF4BDE2),
                            color: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 12.h,
                          decoration: ShapeDecoration(
                            // color: const Color(0xFFF4BDE2),
                            color: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 12.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    12.height,
                    CommonText(
                      text: "Share the beauty, share the gift 💗".tr,
                      fontSize: 12.w,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.screenBackgroundColor,
                    ),
                  ],
                ),
              ),
            ),

            29.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "Exclusive Offer".tr,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.allOfferScreen),
                  child: CommonText(
                    text: "View All".tr,
                    fontSize: 14.w,
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.darkColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            4.height,
            Divider(
              height: 0.01,
              color: AppColor.textColor.withValues(alpha: 0.1),
            ),

            12.height,
            Obx(
              () => controller.isRewardLoading.value
                  ? const HomeRewardListShimmer()
                  : controller.rewardList.isEmpty
                  ? Center(child: CommonText(text: 'No reward available'.tr))
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(controller.rewardList.length, (
                            index,
                          ) {
                            final offer = controller.rewardList[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                right: index == controller.rewardList.length - 1
                                    ? 0
                                    : 16.w,
                              ),
                              child: HomeScreenCard(
                                imageAsset: offer.rewardImage,
                                title: offer.rewardName,
                                subtitle:
                                    'Valid Until ${offer.closedDays.toList().map((e) => e.day).join('.tr, '.tr)}',
                                buttonText: "View Details".tr,
                                onButtonTap: () {
                                  Get.toNamed(
                                    AppRoute.rewardDetailsScreen,
                                    arguments: {'rewardId': offer.id},
                                  );
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }
}
