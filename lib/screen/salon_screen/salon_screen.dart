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
      body: Column(
        children: [
          _appbar(), _searchbar(),
          10.height,

          Expanded(
            child: Obx(() {

              return SmartListLoader(
                onLoadMore: (page) {
                  controller.getSalonList(page: page);
                },
                limit: 10,
                isLoading: controller.isLoading.value,
                itemCount: controller.allSalonList.length,
                itemBuilder: (context, index) {
                  final salon = controller.allSalonList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SalonCard(
                      imageAsset: salon.image,
                      isNetworkImage: true,
                      salonName: salon.businessName,
                      distance: "📍 1.3 km",
                      description: salon.description,
                      statusText: salon.isRewardAvailable,
                      buttonText: "View Details",
                      onButtonTap: () {
                        Get.toNamed(AppRoute.salonDetailsScreen,
                            arguments: {'salonId': salon.id});
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _searchbar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CommonTextField(
        key: Key('slaon_search_field'),
        initialText: controller.search,
        validationType: ValidationType.validateFullName,
        prefixIcon: SvgPicture.asset(AppIcons.searchIcons),
        backgroundColor: AppColor.screenBackgroundColor,
        hintText: "Search",
        onChanged: (val){
          controller.onSearch(val);
        },
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