import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/redem_now/controller/redeem_now_controller.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:zena_app/widget/loading_widget/loading_widget.dart';

class RedemNowScreen extends StatelessWidget {
  const RedemNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RedeemNowController controller = Get.find<RedeemNowController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            //! Top Section (Close Button)
            SafeArea(
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    margin: EdgeInsets.only(top: 16.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7FEF0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 24.sp,
                      color: AppColor.darkColor,
                    ),
                  ),
                ),
              ),
            ),

            //! Center Content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE86DAC).withValues(alpha: 0.1),
                          blurRadius: 30,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        size: 48.sp,
                        color: const Color(0xFFE86DAC),
                      ),
                    ),
                  ),
                  32.height,
                  CommonText(
                    text: "You Deserve this!".tr,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.darkColor,
                  ),
                  8.height,
                  CommonText(
                    text: "Treating yourself is the ultimate self-care.".tr,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.textColor,
                    textAlign: TextAlign.center,
                  ),
                  24.height,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0F7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CommonText(
                      text: "${"POINT BALANCE AFTER REDEMPTION:".tr} ${(controller.myPoint-controller.pointRequired)} ${"points".tr}".tr,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      textColor: const Color(0xFFE86DAC),
                    ),
                  ),
                ],
              ),
            ),

            //! Bottom Buttons
            Obx(
              () => controller.isRedeemLoading.value
                  ? LoadingWidget()
                  : CommonButton(
                      buttonWidth: double.infinity,
                      buttonRadius: 12.w,
                      titleText: "Confirm to Redeem".tr,
                      onTap: () {
                        controller.redeemNow();
                      },
                    ),
            ),
            16.height,
            CommonButton(
              buttonWidth: double.infinity,
              buttonRadius: 12.w,
              titleText: "Cancel".tr,
              buttonColor: const Color(0xFFF2F2F2),
              titleColor: AppColor.textColor,
              onTap: () => Get.back(),
            ),
            40.height,
          ],
        ),
      ),
    );
  }
}
