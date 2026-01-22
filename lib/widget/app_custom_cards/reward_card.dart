import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:zena_app/screen/rewards_screen/controller/rewards_screen_controller.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';

class RewardCard extends StatelessWidget {
  final RewardModel reward;
  final VoidCallback? onTap;

  const RewardCard({
    super.key,
    required this.reward,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF5F5), // Light pink background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Image Section
          Stack(
            children: [
              Container(
                height: 160.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage(reward.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (reward.isRewardReady)
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
                      text: "REWARD READY",
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
                  text: reward.salonName,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.darkColor,
                ),
                4.height,
                CommonText(
                  text: reward.description,
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
                      text: reward.isRewardReady
                          ? "Goal reached!"
                          : "Keep going!",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      textColor: AppColor.darkColor,
                    ),
                    CommonText(
                      text:
                          "${reward.currentPoints}/${reward.goalPoints} points",
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
                      final progress = (reward.currentPoints /
                              reward.goalPoints)
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
                  text: reward.statusText,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  textColor: const Color(0xFFE86DAC),
                ),

                //! Footer Section
                24.height,
                if (reward.isRewardReady)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: reward.footerText ?? "",
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
                            color: const Color(0xFF8FD7B0), // Green
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CommonText(
                            text: reward.buttonText,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.secondaryColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CommonText(
                        text: reward.buttonText,
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
