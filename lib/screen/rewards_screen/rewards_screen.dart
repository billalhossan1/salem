import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/rewards_screen/controller/rewards_screen_controller.dart';

import 'package:zena_app/widget/app_custom_cards/reward_card.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../utils/app_images/app_images.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';
import '../../widget/app_custom_cards/history_card.dart';

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
            20.height,
            Obx(
              () => Row(
                mainAxisSize: .min,
                children: [
                  _tabButton(
                    title: 'Active',
                    isSelected: controller.selectedIndex.value == 0,
                    onTap: () {
                      controller.selectedIndex.value = 0;
                    },
                  ),
                  8.width,
                  _tabButton(
                    title: 'Used',
                    isSelected: controller.selectedIndex.value == 1,
                    onTap: () {
                      controller.selectedIndex.value = 1;
                    },
                  ),
                ],
              ),
            ),
            10.height,
            //! Reward List
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return controller.selectedIndex.value == 0
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.allRewardList.length,
                      separatorBuilder: (context, index) => 24.height,
                      itemBuilder: (context, index) {
                        final reward = controller.allRewardList[index];
                        AppLogger.apiDebug('Reward: ${reward.toJson()}');
                        AppLogger.apiDebug(
                          'visitor Point: ${reward.visitorPoints}',
                        );
                        AppLogger.apiDebug(
                          'reward Point: ${reward.rewardPoints}',
                        );
                        final isRewardReady =
                            reward.visitorPoints >= reward.rewardPoints;
                        return RewardCard(
                          reward: reward,
                          onTap: () {
                            if (isRewardReady) {
                              Get.toNamed(
                                AppRoute.rewardDetailsScreen,
                                arguments: {'rewardId': reward.id},
                              );
                            } else {
                              Get.toNamed(
                                AppRoute.viewHistoryScreen,
                                arguments: {'salonId': reward.salonId},
                              );
                            }
                          },
                        );
                      },
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.height,
                        //! Reward Summary Card
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: Color(0xFFFDE8F3), // Light pink background
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: "REWARD SUMMARY",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      textColor: AppColor.textColor,
                                    ),
                                    8.height,
                                    CommonText(
                                      text: "Total Claimed: 8",
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      textColor: AppColor.darkColor,
                                    ),
                                    8.height,
                                    CommonText(
                                      text: "You've saved 450 stars this month",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      textColor: AppColor.textColor,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 48.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE86DAC),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.access_time_filled,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        24.height,
                        //! Recent Redemptions Title
                        CommonText(
                          text: "Recent Redemptions",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          textColor: AppColor.darkColor,
                        ),
                        16.height,
                        //! History List
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          separatorBuilder: (context, index) => 12.height,
                          itemBuilder: (context, index) {
                            // Dummy data for now, can be moved to controller later
                            bool isUsed = index % 2 != 0;
                            return HistoryCard(
                              image: AppImages.myvisitImages,
                              title: "Manicure Discount",
                              date: "Redeemed on Oct 24, 2023",
                              points: "30+",
                              status: isUsed ? "Used" : "Active",
                              isUsed: isUsed,
                            );
                          },
                        ),
                        24.height,
                        Center(
                          child: CommonText(
                            text: "Showing redemptions from the last 6 months",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.textColor,
                          ),
                        ),
                        40.height,
                      ],
                    );
            }),
            20.height,
          ],
        ),
      ),
    );
  }

  Widget _tabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CommonText(
                text: title,
                fontSize: 24,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                textColor: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
