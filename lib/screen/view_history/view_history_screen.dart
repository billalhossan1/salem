import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/rewards_screen/model/reward_history_model.dart';
import 'package:zena_app/screen/view_history/controller/view_history_controller.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';
import 'package:zena_app/utils/app_images/app_images.dart';
import 'package:zena_app/widget/app_custom_cards/history_card.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';

class ViewHistoryScreen extends StatelessWidget {
  const ViewHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewHistoryController controller = Get.find<ViewHistoryController>();
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      body: Obx(
        () => SmartListLoader(
          isLoading: controller.usedRewardIsLoading.value,
          isLoadDone: controller.isLoadDone.value,
          itemCount: controller.historyList.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          onRefresh: controller.onRefresh,
          onLoadMore: controller.onLoadMore,
          appbar: AppCustomAppbar(
            title: "Redemption History",
            leadingType: LeadingType.back,
            centerTitle: true,
          ),
          itemBuilder: (context, index) {
            // Header block rendered as the first item
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  _SalonSummaryCard(controller: controller),
                  24.height,
                  CommonText(
                    text: "Recent Redemptions",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.darkColor,
                  ),
                  16.height,
                  _HistoryItem(history: controller.historyList[index]),
                ],
              );
            }

            return Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: _HistoryItem(history: controller.historyList[index]),
            );
          },
        ),
      ),
    );
  }
}

class _SalonSummaryCard extends StatelessWidget {
  final ViewHistoryController controller;

  const _SalonSummaryCard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF7DB),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: controller.salon.value.businessName,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 10,
                    ),
                    child: CommonText(
                      text: '📍 1.3 km',
                      textColor: AppColor.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            8.height,
            CommonText(
              text: controller.salon.value.service,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textColor: AppColor.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final History history;

  const _HistoryItem({required this.history});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color:Color(0xffFFF6D0)),
        boxShadow:[
          BoxShadow(
            color: Color(0xffFFF6D0).withValues(alpha: 0.5),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CommonText(text: 'Last visit at ${formatDate(history.createdAt)}'),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Color(0xffFFF6D0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CommonImage(src: AppIcons.star, width: 16, height: 16),
                4.width,
                CommonText(text: '${history.points}'),
              ],
            ),
          ),
        ],
      ),
    );
    //   HistoryCard(
    //   image: AppImages.myvisitImages,
    //   title: history.,
    //   date: _formatDate(history.createdAt),
    //   points: '${history.points}+',
    //   status: isUsed ? "Used" : "Active",
    //   isUsed: isUsed,
    // );
  }
}
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
