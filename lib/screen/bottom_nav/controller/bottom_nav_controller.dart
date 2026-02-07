import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home_screen/home_screen.dart';
import '../../home_screen/controller/home_screen_controller.dart';
import '../../salon_screen/salon_screen.dart';
import '../../salon_screen/controller/salon_screen_controller.dart';
import '../../rewards_screen/rewards_screen.dart';
import '../../rewards_screen/controller/rewards_screen_controller.dart';
import '../../myvisit_screen/myvisit_screen.dart';
import '../../myvisit_screen/controller/myvisit_screen_controller.dart';
import '../../profile_screen/profile_screen.dart';
import '../../profile_screen/controller/profile_screen_controller.dart';

class BottomNavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  // Initialize all controllers at once
  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
  }

  void _initializeControllers() {
    // // Initialize HomeScreenController (should already exist from app_route)
    // if (!Get.isRegistered<HomeScreenController>()) {
    //   Get.put(HomeScreenController());
    // }

    // // Initialize other controllers
    // if (!Get.isRegistered<SalonScreenController>()) {
    //   Get.put(SalonScreenController());
    // }
    // if (!Get.isRegistered<RewardsScreenController>()) {
    //   Get.put(RewardsScreenController());
    // }
    // if (!Get.isRegistered<MyvisitScreenController>()) {
    //   Get.put(MyvisitScreenController());
    // }
    // if (!Get.isRegistered<ProfileScreenController>()) {
    //   Get.put(ProfileScreenController());
    // }
  }

  // List of pages
  final List<Widget> pages = [
    HomeScreen(),
    SalonScreen(),
    const RewardsScreen(),
    const MyvisitScreen(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
