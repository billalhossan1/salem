import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import 'package:zena_app/screen/profile_screen/controller/profile_screen_controller.dart';
import 'package:zena_app/widget/app_custom_cards/profile_menu_item.dart';
import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileScreenController>();
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Profile",
        leadingType: LeadingType.logo,
        centerTitle: true,
        actions: [
          NotificationActionButton(
            notificationCount: 3,
            onTap: () => Get.toNamed(AppRoute.notificationScreen),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.height,
            //! Profile Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: AppColor.secondaryColor.withValues(alpha: 0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: AppColor.secondaryColor.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.profileImage,
                    height: 85.h,
                    width: 85.w,
                  ),
                  12.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Salma Khatun",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.darkColor,
                      ),
                      4.height,
                      CommonText(
                        text: "+97150 123 4567",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                      4.height,
                      Container(
                        height: 24.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: ShapeDecoration(
                          color: AppColor.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              'MEMBER SINCE 2025',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //! Account Settings
            25.height,
            CommonText(
              text: "Account Settings",
              fontWeight: FontWeight.w500,
              fontSize: 18.w,
              textColor: AppColor.darkColor,
            ),
            25.height,

            //! Account Settings Card
            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x263A3A3A),
                    blurRadius: 36,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  //! Edit Profile
                  ProfileMenuItem(
                    icon: AppIcons.editProfileIcons,
                    title: "Edit Profile",
                    onTap: () {
                      // Navigate to edit profile
                      Get.toNamed(AppRoute.editProfileScreen);
                    },
                  ),
                  //! Referal
                  ProfileMenuItem(
                    icon: AppIcons.invitePeople,
                    title: "Invite & Refer Friends",
                    onTap: () {
                      // Navigate to referal screen
                      Get.toNamed(AppRoute.inviteFriendsScreen);
                    },
                  ),
                  //! Language
                  ProfileMenuItem(
                    icon: AppIcons.languageIcons,
                    title: "Language",
                    onTap: () {
                      // Change language
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonText(
                          text: "EN",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          textColor: AppColor.darkColor,
                        ),
                        4.width,
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: AppColor.darkColor,
                        ),
                      ],
                    ),
                  ),
                  //! Notification
                  ProfileMenuItem(
                    icon: AppIcons.notificationIconsSelect,
                    title: "Notification",
                    trailing: Obx(
                      () => Switch(
                        value: controller.isNotificationEnabled.value,
                        onChanged: (value) {
                          controller.toggleNotification(value);
                        },
                        activeThumbColor: AppColor.primaryColor,
                        inactiveThumbColor: AppColor.screenBackgroundColor,
                      ),
                    ),
                  ),
                  //! Privacy and Policy
                  ProfileMenuItem(
                    icon: AppIcons.privacPolicyIcons,
                    title: "Privacy Policy",
                    showDivider: false,
                    onTap: () {
                      // Navigate to privacy policy
                    },
                  ),
                ],
              ),
            ),
            25.height,
            CommonText(
              text: "Contact & Support",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),
            20.height,

            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x263A3A3A),
                    blurRadius: 36,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  //! WhatsApp
                  ProfileMenuItem(
                    icon: AppIcons.whatAppIcons,
                    title: "WhatsApp",
                    onTap: () {},
                  ),
                  //! Email Contact
                  ProfileMenuItem(
                    icon: AppIcons.emailUs,
                    title: "Email Contact",
                    onTap: () {},
                  ),
                  //! Contact Form
                  ProfileMenuItem(
                    icon: AppIcons.contactForm,
                    title: "Contact Form",
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            //! Sing Out Button
            25.height,
            Center(
              child: Container(
                width: 220,
                height: 48,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 08,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0x1EFF5477),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.50,
                      color: const Color(
                        0xFFFF5578,
                      ) /* Other-Color-Error-Color */,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x113A3A3A),
                      blurRadius: 16,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'Sign Out',
                      style: TextStyle(
                        color: const Color(
                          0xFFFF5578,
                        ) /* Other-Color-Error-Color */,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            40.height,
          ],
        ),
      ),
    );
  }
}
