import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/notificaton_screen/controller/notification_screen_controller.dart';
import 'package:zena_app/widget/app_custom_cards/notification_cards.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final controller = Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Notifcations",
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Obx(() {
          return SmartListLoader(
            isLoading: controller.isLoading.value,
            itemCount: controller.notificationList.length,
            onLoadMore: (page) {
              controller.getAllNotification(page: page);
            },
            limit: 10,
            itemBuilder: (context, index) {
              final notification = controller.notificationList[index];
              final title = notification.title;
              final isReview = title.toLowerCase().contains("review");
              final isRead = notification.read;
              final iconAsset = AppIcons.blackStar;
              final timeText = notification.body.isNotEmpty
                  ? notification.body
                  : "Just now";
              final moreKey = GlobalKey();

              return GestureDetector(
                onTap: () {
                  if (!isRead) {
                    controller.readMessage(id: notification.sId);
                  }
                  // if (isReview) {
                  //   Get.toNamed(AppRoute.ratingScreen);
                  // }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isRead
                        ? Colors.transparent
                        : AppColor.primaryColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: NotificationCard(
                    moreKey: moreKey,
                    iconAsset: iconAsset,
                    title: title.isNotEmpty ? title : "Notification",
                    time: timeText,
                    onMoreTap: () {
                      final renderBox = moreKey.currentContext
                          ?.findRenderObject() as RenderBox?;
                      if (renderBox == null) return;
                      final offset = renderBox.localToGlobal(Offset.zero);
                      final size = renderBox.size;
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          offset.dx,
                          offset.dy + size.height,
                          MediaQuery.of(context).size.width - offset.dx - size.width,
                          0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: AppColor.screenBackgroundColor,
                        items: [
                          PopupMenuItem(
                            onTap: () => controller.deleteNotification(
                                id: notification.sId),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: AppColor.errorColor,
                                  size: 18.sp,
                                ),
                                8.width,
                                Text(
                                  "Delete",
                                  style: TextStyle(
                                    color: AppColor.errorColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    iconBackgroundColor: AppColor.secondaryColor,
                    titleColor: isRead ? AppColor.textColor : AppColor.darkColor,
                    timeColor: AppColor.textColor,
                    iconSize: 40.w,
                    titleFontSize: 14.sp,
                    timeFontSize: 12.sp,
                    titleFontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                    timeFontWeight: FontWeight.w400,
                    showDivider: !isReview,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
