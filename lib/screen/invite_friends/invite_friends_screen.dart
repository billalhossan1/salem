import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zena_app/screen/invite_friends/controller/invite_friends_controller.dart';
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
        title: "Invite & Referral",
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
                final code = controller.referralCode;
                final referralLink = 'https://zenaApp.com/referral/$code';
                SharePlus.instance.share(
                  ShareParams(
                    text:
                        'Join me on Zena! Use my referral link to sign up and get exclusive rewards:\n$referralLink',
                    subject: 'You\'re invited to Zena!',
                  ),
                );
              },
              buttonRadius: 12.w,
              buttonWidth: double.infinity,
              buttonColor: AppColor.green100,
              titleColor: AppColor.darkColor,
            ),
            16.height,
            CommonButton(
              titleText: "Invite History",
              onTap: () {},
              buttonRadius: 12.w,
              buttonWidth: double.infinity,
              buttonColor: AppColor.secondaryColor100,
              borderColor: AppColor.secondaryColor100,
              titleColor: AppColor.darkColor,
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
