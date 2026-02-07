import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';
import 'controller/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();

    final List<NavItem> navItems = [
      NavItem(
        selectedIcon: AppIcons.homeIconsSelect,
        unselectedIcon: AppIcons.homeIcons,
        label: 'Home',
      ),
      NavItem(
        selectedIcon: AppIcons.salonIconsSelect,
        unselectedIcon: AppIcons.salonIcons,
        label: 'Salons',
      ),
      NavItem(
        selectedIcon: AppIcons.rewardsIconsSelect,
        unselectedIcon: AppIcons.rewardsIcons,
        label: 'Rewards',
      ),
      NavItem(
        selectedIcon: AppIcons.myVisitIconsSelect,
        unselectedIcon: AppIcons.myVisitIcons,
        label: 'My Visits',
      ),
      NavItem(
        selectedIcon: AppIcons.profileIconsSelect,
        unselectedIcon: AppIcons.profileIcons,
        label: 'Profile',
      ),
    ];

    return Scaffold(
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.h, top: 0.h),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(navItems.length, (index) {
                  final item = navItems[index];
                  final isSelected = controller.currentIndex.value == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => controller.changeIndex(index),
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
                            isSelected
                                ? item.selectedIcon
                                : item.unselectedIcon,
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
        ),
      ),
    );
  }
}

class NavItem {
  final String selectedIcon;
  final String unselectedIcon;
  final String label;

  NavItem({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });
}
