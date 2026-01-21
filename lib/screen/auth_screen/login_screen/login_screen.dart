import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_string/app_string.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bankgroundImages),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                115.height,
                Center(
                  child: Image.asset(
                    AppImages.appImages,
                    height: 59.h,
                    width: 139.w,
                  ),
                ),
                18.height,
                CommonText(
                  text: AppString.beautyRewardsMadeEasy,
                  fontSize: 18.w,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                ),

                32.height,
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: AppColor.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 8.40,
                        offset: Offset(3, 3),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CommonText(
                        text: AppString.logintoYourAccount,
                        fontSize: 16.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                      24.height,
                      CommonPhoneNumberTextFiled(
                        controller: controller.phoneNumberController,
                        countryChange: (country) {
                          controller.onCountryChange(country.countryCode);
                        },
                      ),

                      16.height,
                      //! Contineu Button
                      CommonButton(
                        titleText: AppString.contineu,
                        titleColor: AppColor.textColor,
                        titleSize: 18.w,
                        titleWeight: FontWeight.w500,
                        buttonWidth: double.infinity,
                        onTap: () {},
                      ),

                      24.height,
                      CommonText(
                        text: AppString.byContineuingyouAgreethePrivayPolicy,
                        fontSize: 14.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                    ],
                  ),
                ),
                18.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 65.w),
                        child: Divider(
                          color: AppColor.textColor,
                          thickness: 0.5,
                        ),
                      ),
                    ),
                    10.width,
                    CommonText(
                      text: AppString.orSigninWith,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.textColor,
                    ),
                    10.width,
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 65.w),
                        child: Divider(
                          color: AppColor.textColor,
                          thickness: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                18.height,

                //! Contineu With Google Button
                CommonButton(
                  titleText: AppString.contineuWithGoggle,
                  prefix: SvgPicture.asset(AppIcons.googleIcons),
                  titleColor: AppColor.darkColor,
                  titleSize: 18.w,
                  titleWeight: FontWeight.w500,
                  buttonWidth: double.infinity,
                  buttonColor: AppColor.whiteColor,
                  onTap: () {},
                ),
                12.height,

                //! Contineu With Apple Button
                CommonButton(
                  titleText: AppString.contineuWithApple,
                  prefix: SvgPicture.asset(AppIcons.appleIcons),
                  titleColor: AppColor.darkColor,
                  titleSize: 18.w,
                  titleWeight: FontWeight.w500,
                  buttonWidth: double.infinity,
                  buttonColor: AppColor.whiteColor,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
