import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';

import '../../utils/app_colors/app_colors.dart';
// Import your custom widgets
// import 'package:your_app/widgets/common_text.dart';
// import 'package:your_app/widgets/common_button.dart';
// import 'package:your_app/utils/app_color.dart';
// import 'package:your_app/utils/app_images.dart';

class HomeScreenCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonTap;
  final double? width;
  final double? imageHeight;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final double? buttonFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? subtitleFontWeight;
  final FontWeight? buttonFontWeight;
  final double? borderRadius;
  final double? buttonRadius;
  final double? contentPadding;
  final double? spaceBetweenTitleSubtitle;
  final double? spaceBetweenSubtitleButton;

  const HomeScreenCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonTap,
    this.width,
    this.imageHeight,
    this.backgroundColor,
    this.buttonColor,
    this.buttonTextColor,
    this.titleColor,
    this.subtitleColor,
    this.titleFontSize,
    this.subtitleFontSize,
    this.buttonFontSize,
    this.titleFontWeight,
    this.subtitleFontWeight,
    this.buttonFontWeight,
    this.borderRadius,
    this.buttonRadius,
    this.contentPadding,
    this.spaceBetweenTitleSubtitle,
    this.spaceBetweenSubtitleButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 266.w,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.creamColor,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius??16)
         
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Container(
            height: imageHeight ?? 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius ?? 24),
                topRight: Radius.circular(borderRadius ?? 24),
              ),
              image: DecorationImage(
                image: NetworkImage("${ApiEndpoints.domain}$imageAsset"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Section
          Padding(
            padding: EdgeInsets.all(contentPadding ?? 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title using CommonText
                CommonText(
                  text: title,
                  fontSize: titleFontSize ?? 18.w,
                  fontWeight: titleFontWeight ?? FontWeight.w600,
                  textColor: titleColor ?? AppColor.darkColor,
                ),
                SizedBox(height: spaceBetweenTitleSubtitle ?? 4.h),
                // Subtitle using CommonText
                CommonText(
                  text: subtitle,
                  fontSize: subtitleFontSize ?? 14.w,
                  fontWeight: subtitleFontWeight ?? FontWeight.w400,
                  textColor: subtitleColor ?? AppColor.textColor,
                ),
                SizedBox(height: spaceBetweenSubtitleButton ?? 16.h),
                // Button using CommonButton
                CommonButton(
                  titleText: buttonText,
                  buttonWidth: double.infinity,
                  buttonColor: buttonColor ?? AppColor.primaryColor,
                  titleColor: buttonTextColor ?? AppColor.darkColor,
                  titleSize: buttonFontSize ?? 16.w,
                  buttonRadius: buttonRadius ?? 12.w,
                  titleWeight: buttonFontWeight ?? FontWeight.w500,
                  onTap: onButtonTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* 
Usage Example:

OfferCard(
  imageAsset: AppImages.homeImage1,
  title: "20% Off Hairstyle",
  subtitle: "Valid until Friday",
  buttonText: "View Details",
  onButtonTap: () {
    // Handle button tap
  },
)

// With custom styling:
OfferCard(
  imageAsset: AppImages.homeImage1,
  title: "20% Off Hairstyle",
  subtitle: "Valid until Friday",
  buttonText: "View Details",
  onButtonTap: () {},
  width: 266.w,
  imageHeight: 160.h,
  backgroundColor: AppColor.creamColor,
  buttonColor: AppColor.primaryColor,
  buttonTextColor: AppColor.darkColor,
  titleColor: AppColor.darkColor,
  subtitleColor: AppColor.textColor,
  titleFontSize: 18.w,
  subtitleFontSize: 14.w,
  buttonFontSize: 16.w,
  borderRadius: 24,
  buttonRadius: 12.w,
)
*/
