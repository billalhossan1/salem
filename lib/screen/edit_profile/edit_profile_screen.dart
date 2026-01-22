import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/edit_profile/controller/edit_profile_controller.dart';
import 'package:zena_app/utils/app_icons/app_icons.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import '../../utils/app_colors/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: CommonAppBar(
        title: "Edit Profile",
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 48.w,
            height: 48.h,
            margin: EdgeInsets.only(left: 15.w),
            decoration: ShapeDecoration(
              color: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.textColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            //! Profile Image
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.primaryColor.withValues(alpha: 0.3),
                        width: 4,
                      ),
                      image: DecorationImage(
                        image: AssetImage(AppImages.profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(
                          0xFFE86DAC,
                        ), // Pinkish color from description/context
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: SvgPicture.asset(
                        AppIcons.editProfileImages,
                        width: 16.w,
                        height: 16.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            40.height,

            //! Full Name
            CommonText(
              text: "Full Name",
              fontSize: 16.w,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),
            12.height,
            CommonTextField(
              controller: controller.fullNameController,
              hintText: "Enter your full name",
              validationType: ValidationType.validateFullName,
            ),
            20.height,

            //! Email Address
            CommonText(
              text: "Email Address",
              fontSize: 16.w,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),
            12.height,
            CommonTextField(
              controller: controller.emailController,
              hintText: "Enter your email address",
              validationType: ValidationType.validateEmail,
            ),
            20.height,

            //! Phone Number
            Row(
              children: [
                CommonText(
                  text: "Phone Number",
                  fontSize: 16.w,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.darkColor,
                ),
                CommonText(
                  text: "*",
                  fontSize: 16.w,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.errorColor,
                ),
              ],
            ),
            12.height,
            CommonPhoneNumberTextFiled(
              controller: controller.phoneController,
              borderColor: AppColor.secondaryColor.withValues(alpha: 0.2),
              textInputAction: TextInputAction.done,
              countryChange: (country) {
                controller.onCountryChange(country.countryCode);
              },
            ),
            40.height,

            //! Save Button
            CommonButton(
              titleText: "Save Changes",
              buttonColor: AppColor.primaryColor,
              titleColor: AppColor.darkColor,
              titleSize: 18.w,
              titleWeight: FontWeight.w500,
              buttonWidth: double.infinity,
              buttonRadius: 12,
              onTap: () {
                controller.saveChanges();
              },
            ),
            40.height,
          ],
        ),
      ),
    );
  }
}
