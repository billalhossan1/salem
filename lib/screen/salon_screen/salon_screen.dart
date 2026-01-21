import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_cards/salon_screen_cards.dart';
import 'controller/salon_screen_controller.dart';

class SalonScreen extends StatelessWidget {
  SalonScreen({super.key});
  final controller = Get.find<SalonScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: CommonAppBar(
        title: "Salons",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            18.height,
            CommonTextField(
              validationType: ValidationType.validateFullName,
              prefixIcon: SvgPicture.asset(AppIcons.searchIcons),
              backgroundColor: AppColor.screenBackgroundColor,
              hintText: "Search",
              borderColor: AppColor.textColor.withValues(alpha: 0.2),
            ),
            16.height,
            Expanded(
              child: SmartListLoader(
                itemCount: 10,
                itemBuilder: (context, index) => SalonCard(
                  imageAsset: AppImages.nearBySalon1,
                  salonName: "Bloom Beauty",
                  distance: "1.2 km",
                  description: "Luxury hair & skin care",
                  statusText: "Points are active",
                  buttonText: "View Details",
                  onButtonTap: () {
                    // Your action
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
