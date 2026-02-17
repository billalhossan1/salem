import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

import '../../core/app_route/app_route.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import 'controller/salon_details_controller.dart';

class SalonDetailsScreen extends StatelessWidget {
  const SalonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    // ignore: unused_local_variable
    final controller = Get.put(SalonDetailsController());

    // Get arguments if available, otherwise use defaults
    final arguments = Get.arguments as Map<String, dynamic>?;
    final String image = arguments?['image'] ?? AppImages.salonDetails;
    final String name = arguments?['name'] ?? "Bloom Beauty Lounge";
    final String description =
        arguments?['description'] ??
        "Experience luxury and rejuvenation at Bloom & Glow. Our master stylists specialize in contemporary coloring techniques and premium hair care treatments tailored to your unique beauty.";
    final String status = arguments?['status'] ?? "Points are active here";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Header Image
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50.h,
                        left: 16.w,
                        right: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE7FEF0),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18.sp,
                                  color: AppColor.darkColor,
                                ),
                              ),
                            ),
                            CommonText(
                              text: "Salon Details",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              textColor: AppColor.darkColor,
                            ),
                            Container(
                              width: 40.w,
                              height: 40.h,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7FEF0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Badge(
                                label: Text('3'),
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                child: SvgPicture.asset(
                                  AppIcons.notificationIcons,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Rounded top corners for the content below
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 20.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! Salon Name & Subtitle
                        CommonText(
                          text: name,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          textColor: AppColor.darkColor,
                        ),
                        8.height,
                        CommonText(
                          text: "Signature Hair Care",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          textColor: const Color(0xFFE86DAC),
                        ),
                        16.height,
                        CommonText(
                          text: description,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          textColor: AppColor.textColor,
                          maxLines: 4,
                        ),
                        24.height,

                        //! Services Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppIcons.myVisitIcons,
                              width: 24.w,
                              colorFilter: ColorFilter.mode(
                                AppColor.textColor,
                                BlendMode.srcIn,
                              ),
                            ), // Placeholder icon
                            12.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Services",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    textColor: AppColor.darkColor,
                                  ),
                                  4.height,
                                  CommonText(
                                    text: "Luxury hair & skin care",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    textColor: const Color(0xFFE86DAC),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 32.h,
                          color: AppColor.textColor.withValues(alpha: 0.2),
                        ),

                        //! Opening Hours Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: AppColor.textColor,
                              size: 24.sp,
                            ),
                            12.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Opening Hours",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    textColor: AppColor.darkColor,
                                  ),
                                  12.height,
                                  Container(
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFDE8F3), // Light pink
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        _buildTimeRow(
                                          "Monday -Friday",
                                          "9:00 AM-8:00 PM",
                                        ),
                                        8.height,
                                        _buildTimeRow(
                                          "Saturday",
                                          "10:00 AM-6:00 PM",
                                        ),
                                        8.height,
                                        _buildTimeRow(
                                          "Sunday",
                                          "Closed",
                                          isClosed: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 32.h,
                          color: AppColor.textColor.withValues(alpha: 0.2),
                        ),

                        //! Location Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColor.textColor,
                              size: 24.sp,
                            ),
                            12.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Location",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    textColor: AppColor.darkColor,
                                  ),
                                  4.height,
                                  CommonText(
                                    text: "123 Beauty Lane, Beverly Hills",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    textColor: AppColor.textColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        12.height,
                        CommonButton(
                          buttonWidth: double.infinity,
                          buttonRadius: 12,
                          titleText: "Get Direction",
                          prefix: SvgPicture.asset(AppIcons.getDirection),
                          buttonColor: AppColor.screenBackgroundColor,
                          borderColor: AppColor.textColor,
                        ),
                        24.height,

                        //! Active Points Banner
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                            horizontal: 16.w,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF9E6), // Light yellow
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "🎁 Rewards Active",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                textColor: AppColor.darkColor,
                              ),
                              8.height,
                              CommonText(
                                text: "Points & Offers Available",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                textColor: AppColor.textColor,
                              ),
                            ],
                          ),
                        ),
                        24.height,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //! Bottom Bar
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "YOUR POINTS BALANCE",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.textColor,
                          ),
                          4.height,
                          CommonText(
                            text: "120 Points",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.darkColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40.h,
                      color: AppColor.secondaryColor.withValues(alpha: 0.2),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CommonText(
                            text: "POINTS REQUIRED",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.textColor,
                          ),
                          4.height,
                          CommonText(
                            text: "120 Points",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.darkColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                16.height,
                CommonButton(
                  buttonWidth: double.infinity,
                  buttonRadius: 12.w,
                  titleText: "Enjoy Your Reward",
                  buttonColor: AppColor.primaryColor,
                  titleColor: AppColor.darkColor,
                  onTap: () {
                    Get.toNamed(AppRoute.redemNowScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow(String day, String time, {bool isClosed = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: day,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          textColor: AppColor.textColor,
        ),
        CommonText(
          text: time,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          textColor: isClosed ? Color(0xFFE86DAC) : AppColor.darkColor,
        ),
      ],
    );
  }
}
