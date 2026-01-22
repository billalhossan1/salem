import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import '../../utils/app_colors/app_colors.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: CommonAppBar(
        title: "Invite Friends",
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
          children: [
            Image.asset(AppImages.invitesImages, height: 300.h),
            Center(
              child: CommonText(
                text: "Share Beauty Together",
                fontSize: 28.w,
                fontWeight: FontWeight.w400,
                textColor: AppColor.textColor,
              ),
            ),
            8.height,
            Center(
              child: CommonText(
                text:
                    "Give 10 Stars off their first visit, and you'll\nreceive 50 Stars as a thank you",
                fontSize: 16.w,
                fontWeight: FontWeight.w400,
                textColor: AppColor.textColor,
                maxLines: 2,
              ),
            ),
            20.height,
            CommonButton(
              titleText: "Share Referal Link",
              prefix: SvgPicture.asset(AppIcons.shareReferalLink),
              onTap: () {},
              buttonRadius: 12.w,
              buttonWidth: double.infinity,
              buttonHeight: 48.h,
            ),
            24.height,
            CommonButton(
              titleText: "View History",
              onTap: () {},
              buttonRadius: 12.w,
              buttonWidth: double.infinity,
              buttonColor: AppColor.secondaryColor100,
              borderColor: AppColor.errorColor,
              buttonHeight: 48.h,
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
            ),
            40.height,
          ],
        ),
      ),
    );
  }

  Widget _buildStep({
    required String number,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.green100,
            shape: BoxShape.circle,
          ),
          child: CommonText(
            text: number,
            fontSize: 16.w,
            fontWeight: FontWeight.w500,
            textColor: AppColor.darkColor,
          ),
        ),
        16.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonText(
                text: title,
                fontSize: 16.w,
                fontWeight: FontWeight.w500,
                textColor: AppColor.darkColor,
              ),
              4.height,
              CommonText(
                text: description,
                fontSize: 14.w,
                fontWeight: FontWeight.w400,
                textColor: AppColor.textColor,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
