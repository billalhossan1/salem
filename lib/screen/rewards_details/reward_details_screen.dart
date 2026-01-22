import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import 'controller/reward_details_controller.dart';

class RewardsDetailsScreen extends StatelessWidget {
  const RewardsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(RewardDetailsController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Header Image
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.salonDetails),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50.h,
                        left: 16.w,
                        right: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE7FEF0),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18.sp,
                                  color: AppColor.darkColor,
                                ),
                              ),
                            ),
                            CommonText(
                              text: "Reward Details",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              textColor: AppColor.darkColor,
                            ),
                            Container(
                              width: 40.w,
                              height: 40.h,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7FEF0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Badge(
                                label: Text('3'),
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                child: SvgPicture.asset(
                                  AppIcons.notificationIcons,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  24.height,
                  //! Content
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: "Free Blowdry",
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              textColor: AppColor.darkColor,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE86DAC),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.starIcons,
                                    width: 14.w,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  4.width,
                                  CommonText(
                                    text: "30",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        8.height,
                        CommonText(
                          text: "Signature Hair Care",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          textColor: const Color(0xFFE86DAC),
                        ),
                        16.height,
                        CommonText(
                          text:
                              "Enjoy a professional wash, scalp massage, and signature blowout of your choice. Our master stylists will ensure you leave feeling pampered and looking spectacular.",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.textColor,
                          maxLines: 4,
                        ),
                        24.height,
                        //! What's Included
                        Row(
                          children: [
                            Container(
                              width: 4.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            8.width,
                            CommonText(
                              text: "What's Included",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              textColor: AppColor.darkColor,
                            ),
                          ],
                        ),
                        16.height,
                        _buildIncludedItem("Premium Shampoo & Conditioner"),
                        12.height,
                        _buildIncludedItem("Revitalizing Scalp Massage"),
                        12.height,
                        _buildIncludedItem("Conditioning Treatment"),
                        12.height,
                        _buildIncludedItem("Professional Styling & Blowout"),
                        24.height,
                        //! Redemption Policy
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.w),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: AppColor.secondaryColor.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "!",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                              12.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: "Redemption Policy",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      textColor: AppColor.darkColor,
                                    ),
                                    4.height,
                                    CommonText(
                                      text:
                                          "Valid for 30 days after redemption. Booking required in advance. Subject to availability.",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      textColor: AppColor.textColor,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        24.height,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //! Bottom Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "YOUR BALANCE",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.textColor,
                          ),
                          4.height,
                          CommonText(
                            text: "120 Points",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.darkColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40.h,
                      color: AppColor.secondaryColor.withValues(alpha: 0.2),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CommonText(
                            text: "POINTS REQUIRED",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.textColor,
                          ),
                          4.height,
                          CommonText(
                            text: "120 Points",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.darkColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                16.height,
                CommonButton(
                  buttonWidth: double.infinity,
                  buttonRadius: 12.w,
                  titleText: "Enjoy Your Reward",
                  onTap: () {
                    // Handle redemption
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncludedItem(String text) {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: const Color(0xFFE7FEF0),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 14.sp, color: AppColor.primaryColor),
        ),
        12.width,
        CommonText(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          textColor: AppColor.textColor,
        ),
      ],
    );
  }
}
