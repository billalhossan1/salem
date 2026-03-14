import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:get/get.dart';

class RewardCard extends StatelessWidget {
  final RewardsItemModel reward;
  final VoidCallback? onTap;
  final VoidCallback? onTapViewHistory;

  const RewardCard({
    super.key,
    required this.reward,
    this.onTap,
    this.onTapViewHistory,
  });

  bool get _isRewardReady => reward.visitorPoints >= reward.rewardPoints;
  int get _currentPoints => reward.visitorPoints;
  int get _goalPoints => reward.rewardPoints;

  String get _statusText => _isRewardReady
      ? "YOU DESERVE THIS 💖".tr
      : "${(_goalPoints - _currentPoints).clamp(0, _goalPoints)}" +
            " ${"POINTS REMAINING".tr}";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: reward.rewardImage.isNotEmpty
                    ? CommonImage(
                        src: reward.rewardImage,
                        height: 160.h,

                        width: double.infinity,
                        fill: BoxFit.cover,
                      )
                    : Container(
                        height: 160.h,
                        width: double.infinity,

                        color: Colors.grey.shade200,
                      ),
              ),
              if (_isRewardReady)
                Positioned(
                  bottom: 16.h,
                  left: 16.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE86DAC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CommonText(
                      text: "REWARD READY".tr,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                    ),
                  ),
                ),
            ],
          ),

          //! Content Section
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: reward.rewardName,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.darkColor,
                ),
                4.height,
                CommonText(
                  textAlign: .start,
                  text: reward.description,
                  isDescription: true,
                  maxLines: 3,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                ),
                16.height,

                //! Progress Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: _isRewardReady
                          ? "Goal reached!".tr
                          : "Keep going!".tr,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      textColor: AppColor.darkColor,
                    ),
                    CommonText(
                      text: "$_currentPoints/$_goalPoints ${"points".tr}",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColor.textColor,
                    ),
                  ],
                ),
                8.height,
                //! Custom Progress Bar
                Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final progress =
                          (_currentPoints / _goalPoints.clamp(1, _goalPoints))
                              .clamp(0.0, 1.0);
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: constraints.maxWidth * progress,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE86DAC),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                8.height,
                CommonText(
                  text: _statusText,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  textColor: const Color(0xFFE86DAC),
                ),

                //! Footer Section
                24.height,
                // if (_isRewardReady)
                _currentPoints>= _goalPoints?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: "Ready for a free treatment".tr,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColor.textColor,
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8FD7B0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CommonText(
                          text: "Use my points".tr,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ):SizedBox(),
                // else
                10.height,
                GestureDetector(
                  onTap: onTapViewHistory,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CommonText(
                      text: "View History".tr,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColor.darkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
