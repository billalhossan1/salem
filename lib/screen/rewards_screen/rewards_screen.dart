import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/rewards_screen/controller/rewards_screen_controller.dart';
import 'package:zena_app/widget/app_custom_cards/reward_card.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';
import '../../widget/shimmer/app_shimmer.dart';
import '../../widget/app_custom_cards/history_card.dart';
import 'model/used_reward_model.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RewardsScreenController>();
    return Scaffold(
      appBar: AppCustomAppbar(
        title: "Rewards".tr,
        leadingType: LeadingType.logo,
        centerTitle: true,
        actions: [
          NotificationActionButton(
            notificationCount: 3,
            onTap: () => Get.toNamed(AppRoute.notificationScreen),
          ),
        ],
      ),
      backgroundColor: AppColor.screenBackgroundColor,
      body: Obx(() {
        final tabIndex = controller.selectedIndex.value;
        return SmartListLoader(
          key: ValueKey(tabIndex),
          appbar: _StickyTabBar(controller: controller),
          //TODO::
          initalLoader: const RewardCardListShimmer(itemCount: 4),
          isLoading: tabIndex == 0
              ? controller.isLoading.value
              : controller.usedRewardIsLoading.value,
          isLoadDone: tabIndex == 0
              ? controller.isRewardLoadDone.value
              : controller.isUsedLoadDone.value,
          itemCount: tabIndex == 0
              ? controller.allRewardList.length
              : controller.allUsedReward.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          onRefresh: tabIndex == 0
              ? controller.onRewardRefresh
              : controller.onUsedRewardRefresh,
          onLoadMore: tabIndex == 0
              ? controller.onRewardLoadMore
              : controller.onUsedRewardLoadMore,
          // appbar: _RewardsAppBar(controller: controller),
          onColapsAppbar: _StickyTabBar(controller: controller),
          itemBuilder: (context, index) {
            if (tabIndex == 0) {
              return _ActiveRewardItem(controller: controller, index: index);
            } else {
              return _UsedRewardItem(controller: controller, index: index);
            }
          },
        );
      }),
    );
  }
}


// ─── Sticky tab bar shown when scrolled past the main appbar ─────────────────
class _StickyTabBar extends StatelessWidget {
  final RewardsScreenController controller;
  const _StickyTabBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.screenBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabButton(
              title: 'Active'.tr,
              isSelected: controller.selectedIndex.value == 0,
              onTap: () => controller.onTabChanged(0),
            ),
            8.width,
            TabButton(
              title: 'Used'.tr,
              isSelected: controller.selectedIndex.value == 1,
              onTap: () => controller.onTabChanged(1),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Active reward item ───────────────────────────────────────────────────────
class _ActiveRewardItem extends StatelessWidget {
  final RewardsScreenController controller;
  final int index;
  const _ActiveRewardItem({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    final reward = controller.allRewardList[index];
    AppLogger.apiDebug('Reward: ${reward.toJson()}');
    AppLogger.apiDebug('visitor Point: ${reward.visitorPoints}');
    AppLogger.apiDebug('reward Point: ${reward.rewardPoints}');
    final isRewardReady = reward.visitorPoints >= reward.rewardPoints;
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: RewardCard(
        reward: reward,
        onTap: () {
          if (isRewardReady) {
            Get.toNamed(
              AppRoute.rewardDetailsScreen,
              arguments: {'rewardId': reward.id},
            );
          }
        },
        onTapViewHistory: () {
          Get.toNamed(
            AppRoute.viewHistoryScreen,
            arguments: {'salonId': reward.salonId},
          );
        },
      ),
    );
  }
}

// ─── Used reward item ─────────────────────────────────────────────────────────
class _UsedRewardItem extends StatelessWidget {
  final RewardsScreenController controller;
  final int index;
  const _UsedRewardItem({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    final item = controller.allUsedReward[index];

    // First item gets summary card header
    if (index == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 16.height,
          // _UsedSummaryCard(),
          24.height,
          CommonText(
            text: "Recent Redemptions".tr,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            textColor: AppColor.darkColor,
          ),
          16.height,
          _UsedHistoryCard(item: item),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: _UsedHistoryCard(item: item),
    );
  }
}

class _UsedHistoryCard extends StatelessWidget {
  final UsedRewardModel item;
  const _UsedHistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return HistoryCard(
      image: item.rewardId.rewardImage,
      title: item.rewardId.rewardName,
      date: "Redeemed on ${formatDate(item.createdAt)}",
      points: item.rewardId.rewardPoints.toString(),
      status: "Used",
      isUsed: true,
    );
  }
}

class _UsedSummaryCard extends StatelessWidget {
  const _UsedSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFDE8F3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "REWARD SUMMARY".tr,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.textColor,
                ),
                8.height,
                CommonText(
                  text: "Total Claimed: 8".tr,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.darkColor,
                ),
                8.height,
                CommonText(
                  text: "You've saved 450 stars this month".tr,
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
            decoration: const BoxDecoration(
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
    );
  }
}

// ─── Tab button ────────────────────────────────────────────────────────────────
class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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

// ─── Date formatter (shared utility) ──────────────────────────────────────────
String formatDate(String raw) {
  if (raw.isEmpty) return '';
  try {
    final dt = DateTime.parse(raw);
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  } catch (_) {
    return raw;
  }
}
