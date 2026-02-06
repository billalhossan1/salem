import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import 'package:zena_app/screen/myvisit_screen/controller/myvisit_screen_controller.dart';
import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';

class MyvisitScreen extends StatelessWidget {
  const MyvisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyvisitScreenController controller = Get.put(
      MyvisitScreenController(),
    );
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "My Visits",
        leadingType: LeadingType.logo,
        centerTitle: true,
        actions: [
          NotificationActionButton(
            notificationCount: 3,
            onTap: () => Get.toNamed(AppRoute.notificationScreen),
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
                        text: "Total Points : 120",
                        fontSize: 16.w,
                        fontWeight: FontWeight.w600,
                        textColor: AppColor.darkColor,
                      ),
                      Container(
                        height: 24.h,
                        padding: 
                       EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
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
                            fontSize: 12.sp,
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
            12.height,
            CommonTextField(
              validationType: ValidationType.validateFullName,
              prefixIcon: SvgPicture.asset(AppIcons.searchIcons),
              backgroundColor: AppColor.screenBackgroundColor,
              hintText: "Search",
              borderColor: AppColor.textColor.withValues(alpha: 0.2),
              onChanged: (val) => controller.updateSearchText(val),
            ),
            12.height,
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColor.textColor.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: AppColor.textColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                12.width,
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.toggleDateSort(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColor.textColor.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(color: AppColor.textColor),
                          ),
                          Icon(
                            Icons.calendar_today_outlined,
                            color: AppColor.textColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            12.height,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
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
                children: [
                  // Header
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE7FEF0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Salon Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Date",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF333333),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Service",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF333333),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Status",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF333333),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Points Earned",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF333333),
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.height,
                  // Data Rows
                  Obx(() {
                    if (controller.filteredVisits.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("No visits found"),
                      );
                    }
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 180),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: controller.filteredVisits.map((visit) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        visit.salonName,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF333333),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        visit.date,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF6E6E6E),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        visit.service,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF6E6E6E),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        visit.status,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: visit.status == 'Pending'
                                              ? Colors.orange
                                              : Color(0xFF6E6E6E),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        visit.points,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColor.successColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(color: Color(0xFFEEEEEE), height: 1),
                              8.height,
                            ],
                          );
                        }).toList(),
                      ),
                    );
                  }),
                  SizedBox(height: 12),
                ],
              ),
            ),

            20.height,
            CommonText(
              text: "Referral Status",
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
