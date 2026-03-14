import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';

import '../../screen/home_screen/controller/home_screen_controller.dart';
import '../app_custom_appbar/app_custom_appbar.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenController>();

    return Obx(
      () => NotificationActionButton(
        notificationCount: homeController.count.value,
        onTap: () => Get.toNamed(AppRoute.notificationScreen),
      ),
    );
  }
}
