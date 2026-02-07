import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';
import 'controller/salon_screen_controller.dart';

class SalonScreen extends StatelessWidget {
  SalonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SalonScreenController>();
    return Scaffold(
      appBar: AppCustomAppbar(
        title: "Salons",
        leadingType: LeadingType.logo,
        centerTitle: true,
        actions: [
          NotificationActionButton(
            notificationCount: 3,
            onTap: () => Get.toNamed(AppRoute.notificationScreen),
          ),
        ],
      ),
      backgroundColor: AppColor.screenBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          _tabs(controller),
          16.height,
          _searchbar(),
          16.height,
          // Expanded(
          //   child: Obx(
          //     () => SmartListLoader(
          //       itemCount: controller.filteredSalonList.length,
          //       itemBuilder: (context, index) {
          //         final salon = controller.filteredSalonList[index];
          //         return Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 16.w),
          //           child: SalonCard(
          //             imageAsset: salon["image"]!,
          //             salonName: salon["name"]!,
          //             distance: salon["distance"]!,
          //             description: salon["description"]!,
          //             statusText: salon["status"]!,
          //             buttonText: "View Details",
          //             isPopular: salon["isPopular"] ?? false,
          //             onCardTap: () {
          //               Get.toNamed(
          //                 AppRoute.salonDetailsScreen,
          //                 arguments: salon,
          //               );
          //             },
          //             onButtonTap: () {
          //               Get.toNamed(
          //                 AppRoute.salonDetailsScreen,
          //                 arguments: salon,
          //               );
          //             },
          //             onAddRatingTap: () => _showRatingBottomSheet(context),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _tabs(SalonScreenController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tabButton("Nearest", controller),
          _tabButton("Popular", controller),
          _tabButton("Rating", controller),
        ],
      ),
    );
  }

  Widget _tabButton(String title, SalonScreenController controller) {
    return Obx(() {
      final isSelected = controller.selectedTab.value == title;
      return GestureDetector(
        onTap: () => controller.selectTab(title),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.green100 : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : AppColor.textColor.withValues(alpha: 0.2),
            ),
          ),
          child: CommonText(
            text: title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            textColor: isSelected ? AppColor.charocalColor : AppColor.textColor,
          ),
        ),
      );
    });
  }

  // ignore: unused_element
  void _showRatingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              20.height,
              CommonText(
                text: "Rate this Salon",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                textColor: AppColor.darkColor,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Icon(
                      Icons.star_border,
                      size: 40,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              30.height,
              CommonButton(
                titleText: "Submit Rating",
                onTap: () => Get.back(),
                buttonColor: AppColor.green100,
                titleColor: AppColor.charocalColor,
                buttonRadius: 12,
                buttonWidth: double.infinity,
              ),
              20.height,
            ],
          ),
        );
      },
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
}
