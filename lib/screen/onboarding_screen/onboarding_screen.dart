import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/onboarding_screen/controller/onboarding_screen_controller.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = Get.find<OnboardingScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: controller.onboardingData.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Image Section
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height * 0.65.h,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutCubic,
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.scale(
                            scale: 0.92 + (0.08 * value),
                            child: child,
                          ),
                        );
                      },
                      child: Image.asset(
                        controller.onboardingData[index]["image"]!,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),

                  // Gradient Overlay for Title Visibility
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.42.h,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height * 0.3.h,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColor.secondaryColor.withValues(alpha: 0.05),
                            AppColor.whiteColor,
                            AppColor.whiteColor,
                            AppColor.whiteColor,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Title Text Overlay
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.448.h,
                    left: 20.w,
                    right: 20.w,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 650),
                      curve: Curves.easeOutCubic,
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 14 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: CommonText(
                        text: controller.onboardingData[index]["title"]!,
                        fontSize: 32.w,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textColor: AppColor.darkColor,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Bottom Section (Description Card, Indicators, Button)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55.h,
            // bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Description Card
                Obx(() {
                  final index = controller.currentPage.value;
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeInCubic,
                    transitionBuilder: (child, animation) {
                      final offsetAnimation = Tween<Offset>(
                        begin: const Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(animation);
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      key: ValueKey(
                        controller.onboardingData[index]["subtitle"],
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFECF6F1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: CommonText(
                        text: controller.onboardingData[index]["subtitle"]!,
                        fontSize: 14.w,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        textColor: AppColor.darkColor,
                        maxLines: 3,
                      ),
                    ),
                  );
                }),

                30.height,

                // Indicators
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 6),
                        height: 8.h,
                        width: controller.currentPage.value == index
                            ? 24.w
                            : 8.w,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index
                              ? AppColor.primaryColor
                              : const Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),

                30.height,

                // Next Button
                Obx(() {
                  final progressValue =
                      (controller.currentPage.value + 1) /
                      controller.onboardingData.length;
                  return GestureDetector(
                    onTapDown: (_) => controller.isNextPressed.value = true,
                    onTapUp: (_) {
                      controller.isNextPressed.value = false;
                      controller.nextPage();
                    },
                    onTapCancel: () => controller.isNextPressed.value = false,
                    child: AnimatedScale(
                      scale: controller.isNextPressed.value ? 0.92 : 1,
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOutBack,
                      child: SizedBox(
                        height: 72.h,
                        width: 72.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 450),
                              curve: Curves.easeOutCubic,
                              tween: Tween<double>(
                                begin: 0,
                                end: progressValue,
                              ),
                              builder: (context, value, child) {
                                return SizedBox(
                                  height: 72.h,
                                  width: 72.w,
                                  child: CircularProgressIndicator(
                                    value: value,
                                    strokeWidth: 3.5,
                                    backgroundColor: AppColor.primaryColor
                                        .withValues(alpha: 0.2),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          AppColor.primaryColor,
                                        ),
                                  ),
                                );
                              },
                            ),
                            Container(
                              height: 58.h,
                              width: 58.w,
                              decoration: const BoxDecoration(
                                color: AppColor.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: AppColor.darkColor,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

                40.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
