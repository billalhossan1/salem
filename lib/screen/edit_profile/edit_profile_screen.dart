import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zena_app/screen/auth_screen/login_screen/login_screen.dart';
import 'package:zena_app/screen/edit_profile/controller/edit_profile_controller.dart';

import 'package:zena_app/utils/app_images/app_images.dart';
import 'package:zena_app/widget/loading_widget/loading_widget.dart';

import '../../utils/app_colors/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditProfileController>();
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
      body: FormBuilder(
        entity: null,
        builder: (context,formKey,entity) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              //! Profile Image
              Center(
                child: CommonImagePicker(
                  width: 120,
                  height: 120,
                  borderRadius: 80,
                  pickerIcon: Icons.person,
                  onSaved: (file) {
                    AppLogger.debug("imagePath:=========$file");
                    if (file != null) controller.pickImage(file);
                  },
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
              // CommonPhoneNumberTextFiled(
              //   initalCountryCode:  'US',
              //   controller: controller.phoneController,
              //   borderColor: AppColor.secondaryColor.withValues(alpha: 0.2),
              //   textInputAction: TextInputAction.done,
              //   countryChange: (country) {
              //     controller.onCountryChange(country.countryCode);
              //   },
              // ),
              PhoneTextFiled(controller: controller.phoneController),

              40.height,

              //! Save Button
              Obx(
                () => controller.profile.updateIsLoading.value
                    ? LoadingWidget()
                    : CommonButton(
                        titleText: "Save Changes",
                        buttonColor: AppColor.primaryColor,
                        titleColor: AppColor.darkColor,
                        titleSize: 18.w,
                        titleWeight: FontWeight.w500,
                        buttonWidth: double.infinity,
                        buttonRadius: 12,
                        onTap: () {
                          if(formKey.validateAndSave());
                          controller.onTapSaved();
                        },
                      ),
              ),
              40.height,
            ],
          );
        }
      ),
    );
  }
}
