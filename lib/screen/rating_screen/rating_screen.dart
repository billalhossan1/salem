import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:zena_app/widget/app_custom_appbar/app_custom_appbar.dart';
import 'package:get/get.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int rating = 4;
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Review",
        leadingType: LeadingType.back,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            12.height,
            CommonText(
              text: "Bloom Beauty Lounge".tr,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              textColor: AppColor.darkColor,
            ),
            6.height,
            CommonText(
              text: "Signature Hair Care".tr,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              textColor: AppColor.secondaryColor,
            ),
            28.height,
            CommonText(
              text: "Give Overall Rating".tr,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final starIndex = index + 1;
                final isSelected = rating >= starIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      rating = starIndex;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Icon(
                      Icons.star_rounded,
                      size: 32.sp,
                      color: isSelected
                          ? AppColor.warningColor
                          : AppColor.textColor.withValues(alpha: 0.2),
                    ),
                  ),
                );
              }),
            ),
            32.height,
            Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                text: "Comment".tr,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                textColor: AppColor.darkColor,
              ),
            ),
            12.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColor.textColor.withValues(alpha: 0.2),
                ),
              ),
              child: TextFormField(
                controller: commentController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter your comment here...".tr,
                  hintStyle: TextStyle(
                    color: AppColor.textColor.withValues(alpha: 0.6),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: AppColor.darkColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            32.height,
            CommonButton(
              titleText: "Send Review".tr,
              buttonWidth: double.infinity,
              buttonRadius: 12.w,
              buttonColor: AppColor.primaryColor,
              titleColor: AppColor.darkColor,
              titleSize: 16.sp,
              titleWeight: FontWeight.w500,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
