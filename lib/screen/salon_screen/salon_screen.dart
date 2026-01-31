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

      body: SmartListLoader(
        appbar: Column(children: [_appbar(), _searchbar()]),
        onColapsAppbar: Container(
          color: Colors.white,
          child: Column(children: [_appbar(), _searchbar(), 8.height]),
        ),

        itemCount: controller.salonList.length,
        itemBuilder: (context, index) {
          final salon = controller.salonList[index];
          return SalonCard(
            imageAsset: salon["image"]!,
            salonName: salon["name"]!,
            distance: salon["distance"]!,
            description: salon["description"]!,
            statusText: salon["status"]!,
            buttonText: "View Details",
            onButtonTap: () {
              Get.toNamed(AppRoute.salonDetailsScreen, arguments: salon);
            },
          );
        },
      ),
    );
  }

  Widget _searchbar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CommonTextField(
        validationType: ValidationType.validateFullName,
        prefixIcon: SvgPicture.asset(AppIcons.searchIcons),
        backgroundColor: AppColor.screenBackgroundColor,
        hintText: "Search",
        borderColor: AppColor.textColor.withValues(alpha: 0.2),
      ),
    );
  }

  Widget _appbar() {
    // return AppBar(
    //   surfaceTintColor: Colors.white,
    //   title: Text("Salons"),
    //   backgroundColor: Colors.white,
    // );
    return CommonAppBar(
      title: "Salons",
      hideBack: true,
      backgroundColor: Colors.white,
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
    );
  }
}
