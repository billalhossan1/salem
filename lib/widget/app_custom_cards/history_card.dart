import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';

class HistoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String points;
  final String status;
  final bool isUsed;

  const HistoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.points,
    required this.status,
    this.isUsed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
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
      child: Row(
        children: [
          Image.asset(
            image,
            width: 60.w,
            height: 60.h,
          ),
          8.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: title,
                fontSize: 16.w,
                fontWeight: FontWeight.w500,
                textColor: AppColor.darkColor,
              ),
              CommonText(
                text: date,
                fontSize: 13.w,
                fontWeight: FontWeight.w400,
                textColor: AppColor.textColor,
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Container(
                height: 26.h,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  color: const Color(0xFFE86DAC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.starIcons,
                      width: 20.w,
                      height: 20.h,
                    ),
                    CommonText(
                      text: points,
                      fontSize: 18.w,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.screenBackgroundColor,
                    ),
                  ],
                ),
              ),
              8.height,
              Container(
                height: 24.h,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: ShapeDecoration(
                  color: isUsed
                      ? AppColor.secondaryColor.withValues(alpha: 0.15)
                      : const Color(0x1E3FBA72),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: CommonText(
                  text: status,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textColor: isUsed ? AppColor.textColor : AppColor.successColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
