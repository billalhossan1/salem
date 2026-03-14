import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';

class BottomNav extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.find<BottomNavController>();
    return Scaffold(
      key: scaffoldKey,
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: _buildBottomNavBar(controller),
      backgroundColor: AppColor.screenBackgroundColor,
    );
  }

  Widget _buildBottomNavBar(BottomNavController controller) {
    final List<NavItemData> navItems = [
      NavItemData(
        selectedIcon: 'assets/icons/HomeIconSelect.svg',
        unselectedIcon: 'assets/icons/HomeIcon.svg',
        label: 'Home'.tr,
      ),
      NavItemData(
        selectedIcon: 'assets/icons/SalonIconSelect.svg',
        unselectedIcon: 'assets/icons/SalonIcon.svg',
        label: 'Salons'.tr,
      ),
      NavItemData(
        selectedIcon: 'assets/icons/RewardsIconSelected.svg',
        unselectedIcon: 'assets/icons/RewardsIcon.svg',
        label: 'Rewards'.tr,
      ),
      NavItemData(
        selectedIcon: 'assets/icons/MyVisitIconSelect.svg',
        unselectedIcon: 'assets/icons/MyvisitIcon.svg',
        label: 'My Visits'.tr,
      ),
      NavItemData(
        selectedIcon: 'assets/icons/ProfileIconsSelect.svg',
        unselectedIcon: 'assets/icons/ProfileIcon.svg',
        label: 'Profile'.tr,
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 20.h,
          top: 0.h,
          right: 15.w,
          left: 15.w,
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final isSelected = controller.selectedIndex.value == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.onItemTapped(index),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Top indicator bar
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 3.h,
                        width: isSelected ? 30.w : 0,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      8.height,
                      // Icon
                      SvgPicture.asset(
                        isSelected ? item.selectedIcon : item.unselectedIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                      4.height,
                      // Label
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          color: isSelected
                              ? AppColor.darkColor
                              : AppColor.textColor,
                          fontSize: 12.w,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                        child: Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class NavItemData {
  final String selectedIcon;
  final String unselectedIcon;
  final String label;

  NavItemData({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });
}
