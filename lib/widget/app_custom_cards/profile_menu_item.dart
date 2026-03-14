import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:get/get.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final Color iconBgColor;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool showDivider;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.iconBgColor = const Color(0x26A8D5BA), // Default green bg
    this.onTap,
    this.trailing,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.h,
                  padding: const EdgeInsets.all(12),
                  decoration: ShapeDecoration(
                    color: iconBgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: CommonImage(src: icon),
                ),
                12.width,
                CommonText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.darkColor,
                ),
                const Spacer(),
                trailing ??
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: AppColor.darkColor,
                    ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(height: 1, color: AppColor.textColor.withValues(alpha: 0.1)),
      ],
    );
  }
}