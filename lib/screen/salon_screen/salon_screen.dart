import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';
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
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SalonCard(
              imageAsset: salon["image"]!,
              salonName: salon["name"]!,
              distance: salon["distance"]!,
              description: salon["description"]!,
              statusText: salon["status"]!,
              buttonText: "View Details",
              onButtonTap: () {
                Get.toNamed(AppRoute.salonDetailsScreen, arguments: salon);
              },
            ),
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
    return AppCustomAppbar(
      title: "Salons",
      leadingType: LeadingType.logo,
      centerTitle: true,
      actions: [
        NotificationActionButton(
          notificationCount: 3,
          onTap: () => Get.toNamed(AppRoute.notificationScreen),
        ),
      ],
    );
  }
}