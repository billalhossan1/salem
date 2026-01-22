import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';

class MyvisitScreen extends StatelessWidget {
  const MyvisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: CommonAppBar(
        title: "My Visit",
        hideBack: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoute.notificationScreen);
            },
            child: Container(
              width: 48.w,
              height: 48.h,
              margin: EdgeInsets.only(right: 16.w),
              decoration: ShapeDecoration(
                color: const Color(0xFFE7FEF0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Badge(
                  label: Text('3'), // Show notification count
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  child: SvgPicture.asset(AppIcons.notificationIcons),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Center(child: Image.asset(AppImages.profileImage)),
            12.height,
            Center(
              child: CommonText(
                text: "Salma Khatun",
                fontSize: 22.w,
                fontWeight: FontWeight.w500,
                textColor: AppColor.darkColor,
              ),
            ),
            8.height,

            Center(
              child: Container(
                height: 24.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: ShapeDecoration(
                  color: AppColor.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'MEMBER SINCE 2025',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // CommonButton(
              //   titleText: "Member Since 2025",
              //   buttonColor: AppColor.secondaryColor,
              //   titleColor: AppColor.whiteColor,
              //   //titleSize: 12.w,
              //   titleWeight: FontWeight.w500,
              //   // buttonHeight: 30,
              //   // buttonWidth: 150.w,
              //   buttonRadius: 12.w,
              // ),
            ),
            20.height,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: AppColor.secondaryColor.withValues(alpha: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: AppColor.secondaryColor.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "Total Point : 120",
                        fontSize: 16.w,
                        fontWeight: FontWeight.w600,
                        textColor: AppColor.darkColor,
                      ),
                      Container(
                        height: 24,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE86DAC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          'SILVER TIER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  16.height,
                  Container(
                    height: 12.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.whiteColor,
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.7, // 70% progress
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  12.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: '80 points to go for your next reward',
                        fontSize: 12.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                      CommonText(
                        text: "60%",
                        fontSize: 16.w,
                        fontWeight: FontWeight.w600,
                        textColor: AppColor.darkColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            20.height,
            CommonText(
              text: "View Summary",
              fontSize: 20,

              fontWeight: FontWeight.w500,
            ),

            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: const Color(0x4CFFF1B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x113A3A3A),
                        blurRadius: 16,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          CommonText(
                            text: 'TOTAL VISITS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6E6E6E),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          CommonText(
                            text: '12 Friends',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: const Color(0x4CFFF1B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x113A3A3A),
                        blurRadius: 16,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          Text(
                            'LAST VISIT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6E6E6E),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Jan 12, 2025',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            20.height,
            CommonText(
              text: "Referal Status",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),

            16.height,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: AppColor.secondaryColor.withValues(alpha: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: AppColor.secondaryColor.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.referalStatusIcons,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Successful Referrals:2/3",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.darkColor,
                      ),
                      CommonText(
                        text: "One more for a bonus!",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.successColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      CommonText(
                        text: "+60",
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.secondaryColor,
                      ),
                      CommonText(
                        text: "Point Earned",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            20.height,
            CommonText(
              text: "Current Reward",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),
            16.height,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x113A3A3A),
                    blurRadius: 16,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.myvisitImages,
                    width: 60.w,
                    height: 60.h,
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Manicure Discount",
                        fontSize: 16.w,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.darkColor,
                      ),
                      CommonText(
                        text: "Redeemed on Oct 24, 2023",
                        fontSize: 13.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        height: 26.h,
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE86DAC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.starIcons,
                              width: 20.w,
                              height: 20.h,
                            ),
                            CommonText(
                              text: "30+",
                              fontSize: 18.w,
                              fontWeight: FontWeight.w400,
                              textColor: AppColor.screenBackgroundColor,
                            ),
                          ],
                        ),
                      ),
                      8.height,
                      Container(
                        height: 24.h,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: ShapeDecoration(
                          color: const Color(0x1E3FBA72),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: CommonText(
                          text: "Active",
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.successColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
