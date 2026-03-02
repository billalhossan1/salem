import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
// Import your custom widgets and constants
// import 'package:your_app/widgets/common_text.dart';
// import 'package:your_app/widgets/common_button.dart';
// import 'package:your_app/utils/app_color.dart';
// import 'package:your_app/utils/app_icons.dart';
// import 'package:your_app/utils/app_images.dart';

class SalonCard extends StatelessWidget {
  final String imageAsset;
  final String salonName;
  final String distance;
  final String description;
  final String statusText;
  final String buttonText;
  final VoidCallback onButtonTap;

  const SalonCard({
    super.key,
    required this.imageAsset,
    required this.salonName,
    required this.distance,
    required this.description,
    required this.statusText,
    required this.buttonText,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(color: AppColor.screenBackgroundColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imageAsset,
                  width: 110.w,
                  height: 185.h,
                  fit: BoxFit.cover,
                ),
              ),
              13.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: salonName,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          textColor: AppColor.darkColor,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: ShapeDecoration(
                            color: AppColor.secondaryColor20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: CommonText(
                            text: distance,
                            textAlign: TextAlign.center,
                            textColor: AppColor.secondaryColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    5.height,
                    CommonText(
                      text: description,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.secondaryColor,
                    ),
                    8.height,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFF1B852).withValues(alpha: 0.31),
                        border: Border.all(color: AppColor.primaryColor),
                      ),
                      child: CommonText(
                        text: statusText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.textColor,
                      ),
                    ),
                    8.height,
                    CommonText(
                      text: "Points & Offers Available",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.textColor,
                    ),
                    12.height,
                    CommonButton(
                      titleText: buttonText,
                      onTap: onButtonTap,
                      borderColor: AppColor.primaryColor,
                      buttonColor: AppColor.green100,
                      titleColor: AppColor.darkColor,
                      buttonRadius: 12,
                      buttonWidth: double.infinity,
                      titleSize: 24.sp,
                      titleWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: AppColor.textColor.withValues(alpha: 0.2),
          thickness: 0.5,
        ),
      ],
    );
  }
}

/* 
Usage Example:

SalonCard(
  imageAsset: AppImages.nearBySalon1,
  salonName: "Bloom Beauty",
  distance: "1.2 km",
  description: "Luxury hair & skin care",
  statusText: "Points are active",
  buttonText: "View Details",
  onButtonTap: () {
    // Your action
  },
)

// In ListView:
ListView.builder(
  itemCount: salons.length,
  itemBuilder: (context, index) {
    return SalonCard(
      imageAsset: salons[index].image,
      salonName: salons[index].name,
      distance: salons[index].distance,
      description: salons[index].description,
      statusText: salons[index].status,
      buttonText: "View Details",
      onButtonTap: () {
        // Navigate or action
      },
    );
  },
)
*/