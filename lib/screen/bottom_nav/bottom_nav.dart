import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';

import '../home_screen/home_screen.dart';
import '../myvisit_screen/myvisit_screen.dart';
import '../myvisit_screen/controller/myvisit_screen_controller.dart';
import '../profile_screen/profile_screen.dart';
import '../profile_screen/controller/profile_screen_controller.dart';
import '../rewards_screen/rewards_screen.dart';
import '../rewards_screen/controller/rewards_screen_controller.dart';
import '../salon_screen/salon_screen.dart';
import '../salon_screen/controller/salon_screen_controller.dart';
import 'controller/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();

    // Factory function to create screens lazily with proper controller initialization
    Widget buildScreen(int index) {
      switch (index) {
        case 0:
          // HomeScreen controller is already initialized in app_route.dart
          return HomeScreen();
        case 1:
          // Ensure SalonScreenController is initialized

          return SalonScreen();
        case 2:
          // Ensure RewardsScreenController is initialized

          return const RewardsScreen();
        case 3:
          // Ensure MyvisitScreenController is initialized

          return const MyvisitScreen();
        case 4:
          // Ensure ProfileScreenController is initialized

          return const ProfileScreen();
        default:
          return HomeScreen();
      }
    }

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
      body: Obx(
        () => Stack(
          children: List.generate(5, (index) {
            // Only build the screen if it has been visited
            if (controller.visitedScreens.contains(index)) {
              return Offstage(
                offstage: controller.currentIndex.value != index,
                child: buildScreen(index),
              );
            } else {
              // Return empty container for unvisited screens
              return const SizedBox.shrink();
            }
          }),
        ),
      ),
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
