import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/home_screen/controller/home_screen_controller.dart';
import 'package:zena_app/screen/myvisit_screen/model/active_rewards_model.dart';
import 'package:zena_app/screen/profile_screen/profile_screen.dart';
import 'package:zena_app/screen/myvisit_screen/controller/myvisit_screen_controller.dart';
import 'package:zena_app/screen/myvisit_screen/model/tiar_model.dart';
import 'package:zena_app/widget/notificaiton_widget/notification_widget.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';
import '../../widget/shimmer/app_shimmer.dart';
import '../profile_screen/controller/profile_screen_controller.dart';

import '../rewards_screen/controller/rewards_screen_controller.dart';
import 'widget/visit_history_table.dart';

class MyvisitScreen extends StatelessWidget {
  const MyvisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyvisitScreenController controller =
        Get.find<MyvisitScreenController>();
    final RewardsScreenController rewardsScreenController =
        Get.find<RewardsScreenController>();
    final HomeScreenController homeController =
        Get.find<HomeScreenController>();
    var profile = Get.find<ProfileScreenController>().profileModel.value;

    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "My Visits",
        leadingType: LeadingType.logo,
        centerTitle: true,
        actions: [
          NotificationWidget()
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Center(
              child: CommonImage(
                src: profile.image,
                width: 120,
                height: 120,
                borderRadius: 80,
              ),
            ),
            12.height,
            Center(
              child: CommonText(
                text: profile.name,
                fontSize: 22.w,
                fontWeight: FontWeight.w500,
                textColor: AppColor.darkColor,
              ),
            ),
            8.height,

            Center(
              child: Container(
                height: 24.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: ShapeDecoration(
                  color: AppColor.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'MEMBER SINCE ${getYear(profile.createdAt)}'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.height,
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
                  Obx(() {
                    // Explicitly read both observables here so GetX
                    // registers them as reactive dependencies.
                    final coins = rewardsScreenController.userCoin.value;

                    // Sort ascending by tireCoins — API order is not guaranteed
                    final tiers = [...controller.tiarList]
                      ..sort((a, b) => a.tireCoins.compareTo(b.tireCoins));

                    // Current tier = highest tier whose tireCoins <= coins
                    TiarModel? currentTier;
                    for (final t in tiers) {
                      if (coins >= t.tireCoins) currentTier = t;
                    }

                    // Next tier = lowest tier whose tireCoins > coins
                    TiarModel? nextTier;
                    for (final t in tiers) {
                      if (coins < t.tireCoins) {
                        nextTier = t;
                        break;
                      }
                    }

                    // Progress fraction 0.0–1.0
                    final double progress = () {
                      if (nextTier == null) return 1.0;
                      final base = currentTier?.tireCoins ?? 0;
                      final range = nextTier.tireCoins - base;
                      if (range <= 0) return 1.0;
                      return ((coins - base) / range).clamp(0.0, 1.0);
                    }();
                     print("tire name${currentTier?.tireName??'N/A'}");

                    final tierLabel = currentTier?.tireName ?? '—';
                    final coinsToNext = nextTier != null
                        ? nextTier.tireCoins - coins
                        : 0;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: "${"Total Points".tr} : $coins",
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              textColor: AppColor.darkColor,
                            ),
                            Container(
                              height: 24.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 4.h,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFE86DAC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Text(
                                tierLabel.isEmpty
                                    ? '—'
                                    : '${tierLabel.toUpperCase()} TIER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        16.height,
                        Container(
                          height: 12.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.whiteColor,
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: progress,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColor.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                        12.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: nextTier != null
                                  ? '$coinsToNext ${'points to go for'.tr} ${nextTier.tireName} tier'
                                  : 'Max tier reached 🎉'.tr,
                              fontSize: 12.w,
                              fontWeight: FontWeight.w400,
                              textColor: AppColor.textColor,
                            ),
                            CommonText(
                              text:
                                  '${(progress * 100).toStringAsFixed(0)}%'.tr,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w600,
                              textColor: AppColor.darkColor,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),

            20.height,
            CommonText(
              text: "View Summary".tr,
              fontSize: 20,

              fontWeight: FontWeight.w500,
            ),

            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: const Color(0x4CFFF1B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x113A3A3A),
                        blurRadius: 16,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          CommonText(
                            text: 'TOTAL VISITS'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6E6E6E),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CommonText(
                            text: '${profile.totalVisit}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: const Color(0x4CFFF1B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x113A3A3A),
                        blurRadius: 16,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          CommonText(
                            text: 'LAST VISIT'.tr,
                            textAlign: TextAlign.center,
                            textColor: const Color(0xFF6E6E6E),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          CommonText(
                            text: formatDate(profile.lastVisit),
                            textAlign: TextAlign.center,
                            textColor: const Color(0xFF333333),
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // 12.height,
            // CommonTextField(
            //   validationType: ValidationType.notRequired,
            //   prefixIcon: SvgPicture.asset(AppIcons.searchIcons),
            //   backgroundColor: AppColor.screenBackgroundColor,
            //   hintText: "Search".tr,
            //   borderColor: AppColor.textColor.withValues(alpha: 0.2),
            //   onChanged: (val) => controller.updateSearchText(val),
            // ),
            // 12.height,
            // // ── Filter row ────────────────────────────────────────────────
            // Obx(() {
            //   final hasDate = controller.selectedDate.value != null;
            //   final hasStatus = controller.selectedStatus.value.isNotEmpty;
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         children: [
            //           // ── Status filter ──────────────────────────────
            //           Expanded(
            //             child: GestureDetector(
            //               onTap: () => _showStatusPicker(context, controller),
            //               child: Container(
            //                 padding: const EdgeInsets.symmetric(
            //                   horizontal: 12,
            //                   vertical: 12,
            //                 ),
            //                 decoration: BoxDecoration(
            //                   color: hasStatus
            //                       ? AppColor.secondaryColor.withValues(
            //                           alpha: 0.1,
            //                         )
            //                       : Colors.white,
            //                   borderRadius: BorderRadius.circular(8),
            //                   border: Border.all(
            //                     color: hasStatus
            //                         ? AppColor.secondaryColor
            //                         : AppColor.textColor.withValues(alpha: 0.2),
            //                   ),
            //                 ),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       hasStatus
            //                           ? controller.selectedStatus.value.tr
            //                           : 'Status'.tr,
            //                       style: TextStyle(
            //                         color: hasStatus
            //                             ? AppColor.secondaryColor
            //                             : AppColor.textColor,
            //                         fontWeight: hasStatus
            //                             ? FontWeight.w600
            //                             : FontWeight.w400,
            //                         fontSize: 13,
            //                       ),
            //                     ),
            //                     Icon(
            //                       Icons.chevron_right,
            //                       color: hasStatus
            //                           ? AppColor.secondaryColor
            //                           : AppColor.textColor,
            //                       size: 20,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //           12.width,
            //           // ── Date filter ────────────────────────────────
            //           Expanded(
            //             child: GestureDetector(
            //               onTap: () async {
            //                 // If a date is already selected → clear it
            //                 if (controller.selectedDate.value != null) {
            //                   controller.selectedDate.value = null;
            //                   controller.onUserRewardsRefresh();
            //                   return;
            //                 }
            //                 // Otherwise open the picker
            //                 final picked = await showDatePicker(
            //                   context: context,
            //                   initialDate: DateTime.now(),
            //                   firstDate: DateTime(2020),
            //                   lastDate: DateTime.now(),
            //                   builder: (context, child) => Theme(
            //                     data: Theme.of(context).copyWith(
            //                       colorScheme: ColorScheme.light(
            //                         primary: AppColor.secondaryColor,
            //                         onPrimary: Colors.white,
            //                         surface: Colors.white,
            //                         onSurface: AppColor.darkColor,
            //                       ),
            //                     ),
            //                     child: child!,
            //                   ),
            //                 );
            //                 if (picked != null) {
            //                   controller.selectedDate.value = picked;
            //                   controller.onUserRewardsRefresh();
            //                 }
            //               },
            //               child: Container(
            //                 padding: const EdgeInsets.symmetric(
            //                   horizontal: 12,
            //                   vertical: 12,
            //                 ),
            //                 decoration: BoxDecoration(
            //                   color: hasDate
            //                       ? AppColor.secondaryColor.withValues(
            //                           alpha: 0.1,
            //                         )
            //                       : Colors.white,
            //                   borderRadius: BorderRadius.circular(8),
            //                   border: Border.all(
            //                     color: hasDate
            //                         ? AppColor.secondaryColor
            //                         : AppColor.textColor.withValues(alpha: 0.2),
            //                   ),
            //                 ),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       hasDate
            //                           ? _fmtFilterDate(
            //                               controller.selectedDate.value!,
            //                             )
            //                           : 'Date'.tr,
            //                       style: TextStyle(
            //                         color: hasDate
            //                             ? AppColor.secondaryColor
            //                             : AppColor.textColor,
            //                         fontWeight: hasDate
            //                             ? FontWeight.w600
            //                             : FontWeight.w400,
            //                         fontSize: 13,
            //                       ),
            //                     ),
            //                     Icon(
            //                       hasDate
            //                           ? Icons.close
            //                           : Icons.calendar_today_outlined,
            //                       color: hasDate
            //                           ? AppColor.secondaryColor
            //                           : AppColor.textColor,
            //                       size: 18,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       // ── Clear button ──────────────────────────────────
            //       if (hasDate || hasStatus)
            //         Padding(
            //           padding: const EdgeInsets.only(top: 8),
            //           child: GestureDetector(
            //             onTap: controller.clearVisitFilters,
            //             child: Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 Icon(
            //                   Icons.close,
            //                   size: 14,
            //                   color: AppColor.textColor,
            //                 ),
            //                 4.width,
            //                 Text(
            //                   'Clear filters'.tr,
            //                   style: TextStyle(
            //                     fontSize: 12,
            //                     color: AppColor.textColor,
            //                     decoration: TextDecoration.underline,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //     ],
            //   );
            // }),
            20.height,
            CommonText(text: "My Visits & Points".tr, fontSize: 20),
            10.height,
            const VisitHistoryTable(),

            20.height,
            CommonText(
              text: "Referral Status".tr,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),

            16.height,
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
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.referalStatusIcons,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text:
                            "${"Successful Referrals:".tr} ${profile.successfulInvites}/3",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.darkColor,
                      ),
                      CommonText(
                        text: (profile.successfulInvites < 1)
                            ? "No referrals yet!".tr
                            : (profile.successfulInvites < 2)
                            ? "Great! You’ve referred 1 friend!".tr
                            : (profile.successfulInvites < 3)
                            ? "One more for a bonus!".tr
                            : "Referral Bonus unlocked! 🎉".tr,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.successColor,
                      ),
                    ],
                  ),
                  // Spacer(),
                  // Column(
                  //   children: [
                  //     CommonText(
                  //       text: "+60".tr,
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.w500,
                  //       textColor: AppColor.secondaryColor,
                  //     ),
                  //     CommonText(
                  //       text: "Point Earned".tr,
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400,
                  //       textColor: AppColor.textColor,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            20.height,
            CommonText(
              text: "Current Reward".tr,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),
            16.height,
            Obx(() {
              final items = controller.activeRewards;
              final isLoading = controller.isCurrentRewardsLoading.value;
              final isDone = controller.isCurrentRewardsLoadDone.value;

              if (isLoading && items.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(24),
                  child: const RewardCardListShimmer(itemCount: 4),
                );
              }

              if (items.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: CommonText(
                      text: 'No active rewards'.tr,
                      textColor: AppColor.textColor,
                    ),
                  ),
                );
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: SmartListLoader(
                  isLoading: isLoading,
                  isLoadDone: isDone,
                  onRefresh: controller.onCurrentRewardRefresh,
                  onLoadMore: controller.onCurrentRewardLoadMore,
                  itemCount: items.length,
                  padding: const EdgeInsets.only(bottom: 12),
                  itemBuilder: (context, index) =>
                      _CurrentRewardCard(item: items[index]),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// ── Status picker bottom sheet ─────────────────────────────────────────────
void _showStatusPicker(
  BuildContext context,
  MyvisitScreenController controller,
) {
  final statuses = ['All', 'PENDING', 'APPROVED'];
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            CommonText(
              text: 'Filter by Status'.tr,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 8),
            ...statuses.map(
              (s) => ListTile(
                title: Text(s.tr),
                trailing: Obx(
                  () => controller.selectedStatus.value == (s == 'All' ? '' : s)
                      ? Icon(Icons.check, color: AppColor.secondaryColor)
                      : const SizedBox.shrink(),
                ),
                onTap: () {
                  controller.selectedStatus.value = s == 'All' ? '' : s;
                  controller.onUserRewardsRefresh();
                  Get.back();
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

// ── Format DateTime for filter button label ─────────────────────────────
String _fmtFilterDate(DateTime d) {
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
  return '${d.day} ${months[d.month - 1]} ${d.year}';
}

class _CurrentRewardCard extends StatelessWidget {
  final Purchases item;
  const _CurrentRewardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadows: const [
          BoxShadow(
            color: Color(0x113A3A3A),
            blurRadius: 16,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: item.rewardId.rewardImage.isNotEmpty
                ? Image.network(
                    item.rewardId.rewardImage,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _placeholder(),
                  )
                : _placeholder(),
          ),
          8.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: item.rewardId.rewardName.isNotEmpty
                      ? item.rewardId.rewardName
                      : 'Reward',
                  fontSize: 16.w,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.darkColor,
                ),
                CommonText(
                  text: "Redeemed on ${formatDate(item.createdAt)}".tr,
                  fontSize: 13.w,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                ),
              ],
            ),
          ),
          8.width,
          Column(
            children: [
              Container(
                height: 26.h,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: ShapeDecoration(
                  color: const Color(0xFFE86DAC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppIcons.starIcons,
                      width: 16.w,
                      height: 16.h,
                    ),
                    4.width,
                    CommonText(
                      text: '${item.pointCost}'.tr,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w500,
                      textColor: AppColor.screenBackgroundColor,
                    ),
                  ],
                ),
              ),
              8.height,
              Container(
                height: 24.h,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: ShapeDecoration(
                  color: const Color(0x1E3FBA72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: CommonText(
                  text: 'Active'.tr,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.successColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _placeholder() => Container(
    width: 60.w,
    height: 60.h,
    decoration: BoxDecoration(
      color: AppColor.secondaryColor.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(Icons.card_giftcard, color: AppColor.secondaryColor, size: 28),
  );
}
