import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/myvisit_screen/myvisit_screen.dart';
import 'package:zena_app/screen/profile_screen/profile_screen.dart';
import 'package:zena_app/screen/rewards_screen/rewards_screen.dart';
import 'package:zena_app/screen/salon_screen/salon_screen.dart';

import '../../home_screen/home_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  // Use a getter to create pages on-demand
  List<Widget> get pages => [
    HomeScreen(),
    SalonScreen(),
    RewardsScreen(),
    const MyvisitScreen(),
    const ProfileScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    // Check if there are arguments passed for initial tab selection
    final arguments = Get.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      final initialIndex = arguments['selectedIndex'];
      if (initialIndex != null && initialIndex is int) {
        selectedIndex.value = initialIndex;
      }
    }
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
