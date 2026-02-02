import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/rewards_screen/controller/rewards_screen_controller.dart';

import 'package:zena_app/widget/app_custom_cards/reward_card.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RewardsScreenController());
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Rewards",
        leadingType: LeadingType.logo,
        centerTitle: true,
        actions: [
          NotificationActionButton(
            notificationCount: 3,
            onTap: () => Get.toNamed(AppRoute.notificationScreen),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            //! Balance Card
            Container(
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
                    text: "Balance",
                    textColor: AppColor.darkColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  8.height,
                  Row(
                    children: [
                      CommonText(
                        text: "120",
                        textColor: AppColor.darkColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      CommonText(
                        text: " points",
                        textColor: AppColor.secondaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      SvgPicture.asset(AppIcons.starIcons),
                    ],
                  ),
                ],
              ),
            ),

            //! Category Section
            35.height,
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.selectCategory(index);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        decoration: ShapeDecoration(
                          color: controller.selectedCategoryIndex.value == index
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color:
                                  controller.selectedCategoryIndex.value ==
                                      index
                                  ? AppColor.primaryColor
                                  : AppColor.textColor.withValues(alpha: 0.2),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: controller.categoryList[index],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            textColor:
                                controller.selectedCategoryIndex.value == index
                                ? AppColor.darkColor
                                : AppColor.textColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => 12.width,
                itemCount: controller.categoryList.length,
              ),
            ),
            24.height,
            //! Reward List
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.filteredRewardList.length,
                separatorBuilder: (context, index) => 24.height,
                itemBuilder: (context, index) {
                  final reward = controller.filteredRewardList[index];
                  return RewardCard(
                    reward: reward,
                    onTap: () {
                      if (reward.isRewardReady) {
                        Get.toNamed(AppRoute.rewardDetailsScreen);
                      } else {
                        Get.toNamed(AppRoute.viewHistoryScreen);
                      }
                    },
                  );
                },
              ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }
}
