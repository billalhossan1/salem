import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:zena_app/screen/invite_friends/controller/invite_friends_controller.dart';
import 'package:zena_app/screen/referral_reward/referral_reward_screen.dart';
=======
import 'package:zena_app/core/app_route/app_route.dart';
>>>>>>> 1e5516cf78929e054eaa0e0c99692d1f9c9641e9
import 'package:zena_app/utils/app_icons/app_icons.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';

class InviteFriendsScreen extends StatelessWidget {
  InviteFriendsScreen({super.key});

  final controller = Get.find<InviteFriendsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Invite & Referral\nPeople",
        leadingType: LeadingType.back,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            40.height,
            // Heart illustration
            SizedBox(
              height: 250.h,
              width: 250.w,
              child: CommonImage(src: AppImages.invitesImages),
            ),
            24.height,
            Center(
              child: CommonText(
                text: "Share beauty together",
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                textColor: AppColor.textColor,
              ),
            ),
<<<<<<< HEAD
            32.height,
            // Progress indicators (all gray initially)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInitialIndicator(1),
                16.width,
                _buildInitialIndicator(2),
                16.width,
                _buildInitialIndicator(3),
              ],
=======
            8.height,
            Center(
              child: CommonText(
                text:
                    "Give 10 Points off their first visit, and you'll\nreceive 50 Stars as a thank you",
                fontSize: 16.w,
                fontWeight: FontWeight.w400,
                textColor: AppColor.textColor,
                maxLines: 2,
              ),
>>>>>>> 1e5516cf78929e054eaa0e0c99692d1f9c9641e9
            ),
            16.height,
            CommonText(
              text:
                  "After completing 3 successful referrals, the reward is valid\nfor 30 days and will be automatically applied to your next\nvisit.",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              textColor: AppColor.textColor,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            32.height,
            CommonButton(
              titleText: "Share Referral Link",
              prefix: SvgPicture.asset(AppIcons.shareReferalLink),
              onTap: () {
                // Navigate to referral reward screen
                Get.to(() => ReferralRewardScreen());
              },
              buttonRadius: 12.w,
              buttonWidth: double.infinity,
              buttonColor: AppColor.green100,
              titleColor: AppColor.darkColor,
            ),
            16.height,
            CommonButton(
<<<<<<< HEAD
              titleText: "Invite History",
              onTap: () {},
=======
              titleText: "View History",
              onTap: () {
                Get.toNamed(AppRoute.inviteHistoryScreen);
              },
>>>>>>> 1e5516cf78929e054eaa0e0c99692d1f9c9641e9
              buttonRadius: 12.w,
              buttonWidth: double.infinity,
              buttonColor: AppColor.secondaryColor100,
<<<<<<< HEAD
              borderColor: AppColor.secondaryColor100,
              titleColor: AppColor.darkColor,
=======
              // buttonH/* eight: 48.h, */
            ),
            30.height,
            Row(
              children: [
                Container(
                  width: 4.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                12.width,
                CommonText(
                  text: "How it works",
                  fontSize: 20.w,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.darkColor,
                ),
              ],
            ),
            24.height,
            _buildStep(
              number: "1",
              title: "Invite Friends",
              description:
                  "Send your unique referral link or code to your beauty-loving besties.",
            ),
            20.height,
            _buildStep(
              number: "2",
              title: "They Book",
              description:
                  "When they book their first treatment using your code, they get 10 stars off immediately.",
            ),
            20.height,
            _buildStep(
              number: "3",
              title: "You Get Stars",
              description:
                  "Once their Visit is completed, 50 Stars will be added to your account!",
>>>>>>> 1e5516cf78929e054eaa0e0c99692d1f9c9641e9
            ),
            40.height,
          ],
        ),
      ),
    );
  }

  Widget _buildInitialIndicator(int number) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColor.textColor.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: CommonText(
          text: "$number",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
