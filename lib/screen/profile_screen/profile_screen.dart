import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import 'package:zena_app/screen/profile_screen/controller/profile_screen_controller.dart';
import 'package:zena_app/utils/shared_prefe.dart';
import 'package:zena_app/widget/app_custom_cards/profile_menu_item.dart';
import 'package:zena_app/widget/notificaiton_widget/notification_widget.dart';
import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';
import '../../widget/shimmer/app_shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileScreenController>();
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Profile".tr,
        leadingType: LeadingType.logo,
        centerTitle: true,
        actions: [
         NotificationWidget()
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Obx(() {
          var profile = controller.profileModel.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              4.height,
              //! Profile Card
              controller.isLoading.value
                  ? const ProfileCardShimmer()
                  : Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: AppColor.secondaryColor.withValues(alpha: 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: [
                          BoxShadow(
                            color: AppColor.secondaryColor.withValues(
                              alpha: 0.03,
                            ),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CommonImage(
                            defaultImage: AppImages.defaultProfile,
                            src: profile.image,
                            height: 80,
                            width: 80,
                            borderRadius: 40,
                          ),
                          12.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: profile.name,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                textColor: AppColor.darkColor,
                              ),
                              4.height,
                              CommonText(
                                text: profile.phoneNumber,
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
                                    CommonText(
                                      text:
                                          "${"MEMBER SINCE".tr} ${getYear(profile.createdAt)}",
                                      textColor: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
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
                text: "Account Settings".tr,
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
                      title: "Edit Profile".tr,
                      onTap: () {
                        // Navigate to edit profile
                        Get.toNamed(AppRoute.editProfileScreen);
                      },
                    ),
                    //! Referal
                    ProfileMenuItem(
                      icon: AppIcons.invitePeople,
                      title: "Invite & Refer Friends".tr,
                      onTap: () {
                        // Navigate to referal screen
                        Get.toNamed(AppRoute.inviteFriendsScreen);
                      },
                    ),
                    //! Language
                    ProfileMenuItem(
                      icon: AppIcons.languageIcons,
                      title: "Language".tr,
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CommonText(
                                  text: "Select Language".tr,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  textColor: AppColor.darkColor,
                                ),
                                const SizedBox(height: 20),
                                ListTile(
                                  title: const Text("English"),
                                  onTap: () async {
                                    await SharePrefsHelper.setString(
                                      SharedPreferenceValue.language,
                                      'en',
                                    );
                                    Get.updateLocale(const Locale('en'));
                                    Get.offAllNamed(AppRoute.splashscreen);
                                  },
                                  trailing: Get.locale?.languageCode == 'en'
                                      ? Icon(
                                          Icons.check,
                                          color: AppColor.primaryColor,
                                        )
                                      : null,
                                ),
                                ListTile(
                                  title: const Text("العربية"),
                                  onTap: () async {
                                    await SharePrefsHelper.setString(
                                      SharedPreferenceValue.language,
                                      'ar',
                                    );
                                    Get.updateLocale(const Locale('ar'));
                                    Get.offAllNamed(AppRoute.splashscreen);
                                  },
                                  trailing: Get.locale?.languageCode == 'ar'
                                      ? Icon(
                                          Icons.check,
                                          color: AppColor.primaryColor,
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonText(
                            text: Get.locale?.languageCode == 'ar'
                                ? "عربي"
                                : "EN",
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
                      title: "Notification".tr,
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
                      title: "Privacy Policy".tr,
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
                text: "Contact & Support".tr,
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
                      icon: AppImages.whatsappImages,
                      title: "WhatsApp".tr,
                      onTap: () {},
                    ),
                    //! Email Contact
                    ProfileMenuItem(
                      icon: AppImages.emailImages,
                      title: "Email Contact".tr,
                      onTap: () {},
                    ),
                    //! Contact Form
                    ProfileMenuItem(
                      icon: AppImages.contactImages,
                      title: "Contact Form".tr,
                      showDivider: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              //! Sing Out Button
              25.height,
              Center(
                child: GestureDetector(
                  onTap: () {
                    SharePrefsHelper.remove(SharedPreferenceValue.token);
                    Get.offAllNamed(AppRoute.loginScreen);
                  },
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
                    child: Center(
                      child: Text(
                        'Sign Out'.tr,
                        style: TextStyle(
                          color: const Color(
                            0xFFFF5578,
                          ) /* Other-Color-Error-Color */,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              40.height,
            ],
          );
        }),
      ),
    );
  }
}

String getYear(String isoDate) {
  if (isoDate.isEmpty) {
    return 'N/A';
  }
  DateTime dateTime = DateTime.parse(isoDate);
  return dateTime.year.toString();
}
