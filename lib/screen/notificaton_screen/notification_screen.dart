import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/notificaton_screen/controller/notification_screen_controller.dart';
import 'package:zena_app/widget/app_custom_cards/notification_cards.dart';

import '../../utils/app_colors/app_colors.dart';
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
        child: SmartListLoader(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return NotificationCard(
              iconAsset: notification["icon"]!,
              title: notification["title"]!,
              time: notification["time"]!,
              onMoreTap: () {},
              iconBackgroundColor: AppColor.secondaryColor,
              titleColor: AppColor.textColor,
              timeColor: AppColor.textColor,
              iconSize: 40.w,
              titleFontSize: 14.sp,
              timeFontSize: 12.sp,
              titleFontWeight: FontWeight.w500,
              timeFontWeight: FontWeight.w400,
            );
          },
        ),
      ),
    );
  }
}
