import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';

class HowItWorkInviteScreen extends StatelessWidget {
  const HowItWorkInviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "How it Works",
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
                  AppIcons.invitePeople,
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
              text: "Share the Love 💖".tr,
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
                  _buildBulletPoint("Invite 3 friends to Zena"),
                  8.height,
                  _buildBulletPoint("When they visit, you get a reward 🎁"),
                  8.height,
                  _buildBulletPoint(
                    "Your friend gets 100 points too (you both win!) 💕",
                  ),
                  8.height,
                  _buildBulletPoint(
                    "Maximum 3 invites per month Keep the tone warm, happy, and encouraging — but easy to understand in seconds.",
                  ),
                  8.height,
                ],
              ),
            ),
            Spacer(),
            CommonText(
              text:
                  "Invite a friend, they visit, and you both get something special to smile about.".tr,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: AppColor.textColor,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            24.height,
            CommonButton(
              titleText: "Invite a Friend".tr,
              onTap: () {
                // Navigate to invite friend
                Get.toNamed(AppRoute.inviteFriendsScreen);
              },
              buttonColor: AppColor.primaryColor,
              titleColor: AppColor.darkColor,
              buttonRadius: 12,
              buttonWidth: double.infinity,
            ),
            // 16.height,
            // CommonButton(
            //   titleText: "Invite History".tr,
            //   onTap: () {
            //     Get.toNamed(AppRoute.inviteFriendsScreen);
            //   },
            //   buttonColor: Colors.white,
            //   titleColor: AppColor.textColor,
            //   borderColor: AppColor.darkColor,
            //   buttonRadius: 12,
            //   buttonWidth: double.infinity,
            // ),
            // 40.height,
            65.height,
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
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
            text: text,
            fontSize: 16.sp,
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
