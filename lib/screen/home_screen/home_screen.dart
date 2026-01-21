import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/home_screen/controller/home_screen_controller.dart';
import 'package:zena_app/widget/app_custom_cards/home_screen_card.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: CommonAppBar(
        title: "Home",
        hideBack: true,
        actions: [
          Container(
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
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            10.height,
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
                  CommonText(
                    text: "You are getting closer!",
                    fontSize: 16.w,
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.darkColor,
                  ),
                  12.height,
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.starIcons),
                      6.width,
                      CommonText(
                        text: "120",
                        fontSize: 24.w,
                        fontWeight: FontWeight.w600,
                        textColor: AppColor.darkColor,
                      ),
                      3.width,
                      CommonText(
                        text: "Points Collected",
                        fontSize: 16.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
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
                        text: "Just 80 points to go 💖",
                        fontSize: 12.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                      CommonText(
                        text: "Your reward is waiting ✨",
                        fontSize: 12.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommonButton(
                  titleText: "View Reward",
                  buttonColor: AppColor.green100,
                  buttonRadius: 12.w,
                  titleColor: AppColor.darkColor,
                  titleSize: 18.w,
                  titleWeight: FontWeight.w500,
                  onTap: () {},
                ),
                CommonButton(
                  titleText: "Invite a Friend",
                  buttonRadius: 12.w,
                  buttonColor: AppColor.secondaryColor,
                  titleColor: AppColor.darkColor,
                  titleSize: 18.w,
                  titleWeight: FontWeight.w500,
                  onTap: () {},
                ),
              ],
            ),
            29.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "Exclusive Offer",
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                ),
                CommonText(
                  text: "View All",
                  fontSize: 14.w,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.darkColor,
                  decoration: TextDecoration.underline,
                ),
              ],
            ),
            4.height,
            Divider(
              height: 0.01,
              color: AppColor.textColor.withValues(alpha: 0.1),
            ),

            12.height,
            SizedBox(
              height: 300.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.exclusiveOffers.length,
                separatorBuilder: (context, index) => 16.width,
                itemBuilder: (context, index) {
                  final offer = controller.exclusiveOffers[index];
                  return HomeScreenCard(
                    imageAsset: offer["image"]!,
                    title: offer["title"]!,
                    subtitle: offer["subtitle"]!,
                    buttonText: "View Details",
                    onButtonTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
