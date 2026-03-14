import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_stepper/smart_stepper.dart';
import 'package:zena_app/screen/invite_friends/controller/invite_friends_controller.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';
import 'package:zena_app/utils/app_images/app_images.dart';
import 'package:zena_app/widget/app_custom_appbar/app_custom_appbar.dart';

class ReferralRewardScreen extends StatelessWidget {
  ReferralRewardScreen({super.key});

  final controller = Get.find<InviteFriendsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Reward",
        leadingType: LeadingType.back,
        centerTitle: true,
      ),
      body: Obx(() {
        // Show reward ready screen if 3 referrals completed
        if (controller.isRewardReady) {
          return _buildRewardReadyScreen(context);
        }
        // Show progress screen
        return _buildProgressScreen(context);
      }),
      // Add FAB for testing (remove in production)
      floatingActionButton: Obx(() {
        if (!controller.isRewardReady) {
          return FloatingActionButton.extended(
            onPressed: () {
              controller.simulateReferralComplete();
            },
            backgroundColor: AppColor.primaryColor,
            label: CommonText(
              text: "Simulate".tr,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),
            icon: Icon(Icons.add, color: AppColor.darkColor),
          );
        }
        return SizedBox.shrink();
      }),
    );
  }

  Widget _buildProgressScreen(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Heart illustration
          SizedBox(
            height: 200.h,
            width: 200.w,
            child: CommonImage(src: AppImages.invitesImages),
          ),

          24.height,

          CommonText(
            text: "Share beauty together".tr,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            textColor: AppColor.textColor,
            textAlign: TextAlign.center,
          ),

          12.height,

          // Unlock reward card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColor.green100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                CommonText(
                  text: "Unlock a Special\nReward ✨".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.darkColor,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                12.height,
                CommonText(
                  text:
                      "Unlock your discount when 3 friends complete\ntheir first visit.".tr,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          ),

          20.height,

          // Progress indicators
          _buildProgressIndicators(),

          16.height,

          // Progress text
          Obx(() {
            final remaining = controller.remainingReferrals;
            final friendText = remaining == 1 ? "friend" : "friends";
            final numberText = remaining == 1 ? "one" : "two";
            return RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColor,
                  height: 1.5,
                ),
                children: [
                  TextSpan(text: "You're ".tr),
                  TextSpan(
                    text: "$numberText $friendText".tr,
                    style: TextStyle(
                      color: AppColor.successColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: " away from your reward!".tr),
                ],
              ),
            );
          }),

          8.height,

          CommonText(
            text:
                "After completing 3 successful referrals, the reward is valid\nfor 30 days and will be automatically applied to your next\nvisit".tr,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            textColor: AppColor.textColor,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),

          20.height,

          // Share Referral Link button
          CommonButton(
            titleText: "Share Referral Link".tr,
            prefix: SvgPicture.asset(AppIcons.shareReferalLink),
            onTap: () {
              // Share referral link logic
            },
            buttonColor: AppColor.green100,
            titleColor: AppColor.darkColor,
            buttonRadius: 12,
            buttonWidth: double.infinity,
          ),

          16.height,

          // Invite History button
          CommonButton(
            titleText: "Invite History".tr,
            onTap: () {
              // Navigate to invite history
            },
            buttonColor: AppColor.secondaryColor100,
            titleColor: AppColor.darkColor,
            borderColor: AppColor.secondaryColor100,
            buttonRadius: 12,
            buttonWidth: double.infinity,
          ),

          40.height,
        ],
      ),
    );
  }

  Widget _buildProgressIndicators() {
    return Obx(() {
      final completed = controller.completedReferrals.value;
      // SmartStepper requires currentStep to start from 1, not 0
      // So we add 1 to the completed count (0 becomes 1, 1 becomes 2, etc.)
      final currentStep = completed + 1;

      return SmartStepper(
        currentStep: currentStep,
        totalSteps: 3,
        lineWidth: 40.w,
        stepHeight: 40.h,
        stepWidth: 40.w,
        completeLineColor: AppColor.primaryColor,
        currentLineColor: AppColor.primaryColor,
        inactiveLineColor: AppColor.textColor.withValues(alpha: 0.3),
        completeStepColor: AppColor.primaryColor,
        currentStepColor: AppColor.primaryColor,
        inactiveStepColor: AppColor.textColor.withValues(alpha: 0.3),
        lineHeight: 2.h,
        onStepperTap: (index) {
          // Optional: Handle tap if needed
        },
      );
    });
  }

  Widget _buildRewardReadyScreen(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          40.height,

          // Reward card with goal achieved badge
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.green100, width: 2),
            ),
            child: Column(
              children: [
                // Goal achieved badge
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: AppColor.secondaryColor,
                        size: 18.w,
                      ),
                      6.width,
                      CommonText(
                        text: "GOAL ACHIEVED".tr,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        textColor: AppColor.secondaryColor,
                      ),
                    ],
                  ),
                ),

                20.height,

                CommonText(
                  text: "Reward Ready!".tr,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.darkColor,
                ),

                12.height,

                CommonText(
                  text:
                      "Congratulations! You've successfully referred 3\nfriends.".tr,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),

                24.height,

                // Reward amount card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColor.green100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "YOUR REWARD".tr,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textColor,
                      ),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonText(
                            text: "20 AED Off".tr,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.darkColor,
                          ),
                          Icon(
                            Icons.emoji_events,
                            color: AppColor.primaryColor,
                            size: 40.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          24.height,

          // Info card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColor.textColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: AppColor.textColor, size: 20.w),
                12.width,
                Expanded(
                  child: CommonText(
                    text:
                        "This reward will be automatically applied by the salon on your next visit. No action needed from your side.".tr,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.textColor,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),

          32.height,

          // Book Your Visit button
          CommonButton(
            titleText: "Book Your Visit".tr,
            onTap: () {
              // Navigate to booking
              Get.back();
            },
            buttonColor: AppColor.green100,
            titleColor: AppColor.darkColor,
            buttonRadius: 12,
            buttonWidth: double.infinity,
          ),

          40.height,
        ],
      ),
    );
  }
}
