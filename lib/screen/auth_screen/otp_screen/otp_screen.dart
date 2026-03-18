import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/screen/auth_screen/otp_screen/controller/otp_screen_controller.dart';
import 'package:zena_app/widget/loading_widget/loading_widget.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_string/app_string.dart';

class OptScreen extends StatelessWidget {
  const OptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpScreenController>();
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
          TextField(
            controller: controller.otpController,
            focusNode: controller.focusNode,
            keyboardType: TextInputType.number,
            autofocus: true,
            maxLength: 4,
            onChanged: (value) {
              if (value.length > 4) {
                controller.otpController.text = value.substring(0, 4);
                controller.otpController.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.otpController.text.length),
                );
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 60.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 48.w,
                    height: 48.h,
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
                24.height,
                CommonText(
                  text: AppString.verificationCode.tr,
                  fontSize: 28.w,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                ),
                12.height,
                CommonText(
                  text: AppString.enter4digitWehaveSentto.tr,
                  fontSize: 16.w,
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
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(
                            context,
                          ).requestFocus(controller.focusNode);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(4, (index) {
                              return Obx(() {
                                final code = controller.otpCode.value;
                                final isFilled = index < code.length;
                                final char = isFilled ? code[index] : "";
                                return Container(
                                  width: 60.w,
                                  height: 60.w,
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    color: isFilled
                                        ? const Color(0xFFF2FBF6)
                                        : const Color(0x147A7A7A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    shadows: isFilled
                                        ? [
                                            BoxShadow(
                                              color: const Color(0xFF86D5A8),
                                              offset: const Offset(0, 4),
                                              blurRadius: 0,
                                              spreadRadius: 0,
                                            ),
                                          ]
                                        : null,
                                  ),
                                  child: isFilled
                                      ? CommonText(
                                          text: char,
                                          fontSize: 24.w,
                                          fontWeight: FontWeight.w600,
                                          textColor: AppColor.darkColor,
                                        )
                                      : Container(
                                          width: 12.w,
                                          height: 12.w,
                                          decoration: const ShapeDecoration(
                                            color: Color(0x6B7A7A7A),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                );
                              });
                            }),
                          ),
                        ),
                      ),
                      40.height,
                      CommonText(
                        text: AppString.didntReceiveIt.tr,
                        fontSize: 14.w,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 16.w,
                            color: AppColor.secondaryColor,
                          ),
                          4.width,
                          Obx(
                            () => CommonText(
                              text:
                                  "Resend Code in 00:${controller.secondsRemaining.value.toString().padLeft(2, '0')}".tr,
                              fontSize: 14.w,
                              fontWeight: FontWeight.w400,
                              textColor: AppColor.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                48.height,
               Obx(()=> controller.isLoading.value?LoadingWidget():CommonButton(
                 buttonWidth: double.infinity,
                 titleText: AppString.next.tr,
                 titleSize: 18.w,
                 titleWeight: FontWeight.w500,
                 titleColor: AppColor.charocalColor,
                 onTap: () {
                   controller.onTapVerify();
                 },
               ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
