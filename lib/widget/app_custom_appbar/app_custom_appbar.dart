import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../utils/app_images/app_images.dart';

enum LeadingType { logo, back, none }

class AppCustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final LeadingType leadingType;
  final Widget? customLeading;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool centerTitle;
  final double elevation;

  const AppCustomAppbar({
    super.key,
    required this.title,
    this.leadingType = LeadingType.back,
    this.customLeading,
    this.actions,
    this.onBackPressed,
    this.backgroundColor,
    this.titleColor,
    this.centerTitle = false,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CommonText(
        text: title,
        style: TextStyle(
          color: titleColor ?? Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? AppColor.screenBackgroundColor,
      surfaceTintColor: AppColor.screenBackgroundColor,
      elevation: elevation,
      automaticallyImplyLeading: false,
      leading: _buildLeading(),
      leadingWidth: leadingType == LeadingType.logo ? 120.w : 56.w,
      actions: actions,
    );
  }

  Widget? _buildLeading() {
    // If custom leading is provided, use it
    if (customLeading != null) {
      return customLeading;
    }

    // Build leading based on type
    switch (leadingType) {
      case LeadingType.logo:
        return _buildLogoLeading();
      case LeadingType.back:
        return _buildBackLeading();
      case LeadingType.none:
        return null;
    }
  }

  Widget _buildLogoLeading() {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 8.h, bottom: 8.h),
      child: CommonImage(
        src: AppImages.appImages,
        // height: 24.h,
        // width: 60.w,
        //fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildBackLeading() {
    return Center(
      child: GestureDetector(
        onTap: onBackPressed ?? () => Get.back(),
        child: Container(
          width: 48.w,
          height: 48.h,
          margin: EdgeInsets.only(left: 16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFE7FEF0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.darkColor,
            size: 16.sp,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// Helper widget for notification action button
class NotificationActionButton extends StatelessWidget {
  final int? notificationCount;
  final VoidCallback onTap;

  const NotificationActionButton({
    super.key,
    this.notificationCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48.w,
        height: 48.h,
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFE7FEF0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.notificationIcons,
              width: 18.w,
              height: 18.h,
              colorFilter: ColorFilter.mode(
                AppColor.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            if (notificationCount != null && notificationCount! > 0)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: CommonText(
                      text: '$notificationCount'.tr,
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ============ USAGE EXAMPLES ============

// // Example 1: Home Screen with Logo Leading (Like Image 1)
// class HomeScreenExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: "Home",
//         leadingType: LeadingType.logo,
//         centerTitle: true,
//         actions: [
//           NotificationActionButton(
//             notificationCount: 3,
//             onTap: () => Get.toNamed(AppRoute.notificationScreen),
//           ),
//         ],
//       ),
//       body: Container(),
//     );
//   }
// }

// // Example 2: Detail Screen with Back Button (Like Image 2)
// class DetailScreenExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: "How it works",
//         leadingType: LeadingType.back,
//         centerTitle: true,
//       ),
//       body: Container(),
//     );
//   }
// }

// // Example 3: Screen with No Leading Widget
// class NoLeadingScreenExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: "Settings",
//         leadingType: LeadingType.none,
//         centerTitle: true,
//       ),
//       body: Container(),
//     );
//   }
// }

// // Example 4: Custom Leading Widget
// class CustomLeadingExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: "Profile",
//         customLeading: Padding(
//           padding: EdgeInsets.all(8.w),
//           child: CircleAvatar(
//             backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(),
//     );
//   }
// }

// // Example 5: Custom Back Action
// class CustomBackExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: "Form",
//         leadingType: LeadingType.back,
//         centerTitle: true,
//         onBackPressed: () {
//           // Show confirmation dialog before going back
//           Get.dialog(
//             AlertDialog(
//               title: Text('Discard changes?'.tr),
//               actions: [
//                 TextButton(
//                   onPressed: () => Get.back(),
//                   child: Text('Cancel'.tr),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Get.back(); // Close dialog
//                     Get.back(); // Go back to previous screen
//                   },
//                   child: Text('Discard'.tr),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       body: Container(),
//     );
//   }
// }

// // Example 6: With multiple actions
// class MultipleActionsExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: "Messages",
//         leadingType: LeadingType.back,
//         centerTitle: true,
//         actions: [
//           GestureDetector(
//             onTap: () {},
//             child: Container(
//               width: 32.w,
//               height: 32.h,
//               margin: EdgeInsets.only(right: 8.w),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE7FEF0),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(
//                 Icons.search,
//                 color: AppColor.primaryColor,
//                 size: 18.sp,
//               ),
//             ),
//           ),
//           NotificationActionButton(
//             notificationCount: 5,
//             onTap: () => Get.toNamed(AppRoute.notificationScreen),
//           ),
//         ],
//       ),
//       body: Container(),
//     );
//   }
// }
