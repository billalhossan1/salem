import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';
import 'package:zena_app/widget/app_custom_cards/history_card.dart';

import '../../utils/app_colors/app_colors.dart';

class ViewHistoryScreen extends StatelessWidget {
  const ViewHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: CommonAppBar(
        title: "Redemption History",
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 48.w,
            height: 48.h,
            margin: EdgeInsets.only(left: 15.w),
            decoration: ShapeDecoration(
              color: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.textColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            //! Reward Summary Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Color(0xFFFDE8F3), // Light pink background
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "REWARD SUMMARY",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          textColor: AppColor.textColor,
                        ),
                        8.height,
                        CommonText(
                          text: "Total Claimed: 8",
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          textColor: AppColor.darkColor,
                        ),
                        8.height,
                        CommonText(
                          text: "You've saved 450 stars this month",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.textColor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFE86DAC),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.access_time_filled,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
            24.height,
            //! Recent Redemptions Title
            CommonText(
              text: "Recent Redemptions",
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              textColor: AppColor.darkColor,
            ),
            16.height,
            //! History List
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (context, index) => 12.height,
              itemBuilder: (context, index) {
                // Dummy data for now, can be moved to controller later
                bool isUsed = index % 2 != 0;
                return HistoryCard(
                  image: AppImages.myvisitImages,
                  title: "Manicure Discount",
                  date: "Redeemed on Oct 24, 2023",
                  points: "30+",
                  status: isUsed ? "Used" : "Active",
                  isUsed: isUsed,
                );
              },
            ),
            24.height,
            Center(
              child: CommonText(
                text: "Showing redemptions from the last 6 months",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textColor: AppColor.textColor,
              ),
            ),
            40.height,
          ],
        ),
      ),
    );
  }
}
