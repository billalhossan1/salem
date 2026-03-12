import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
// Import your custom widgets and constants
// import 'package:your_app/widgets/common_text.dart';
// import 'package:your_app/utils/app_color.dart';
// import 'package:your_app/utils/app_icons.dart';

class NotificationCard extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String time;
  final VoidCallback? onMoreTap;
  final Color? iconBackgroundColor;
  final Color? titleColor;
  final Color? timeColor;
  final Color? dividerColor;
  final double? iconSize;
  final double? titleFontSize;
  final double? timeFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? timeFontWeight;
  final double? topMargin;
  final double? bottomMargin;
  final double? iconPadding;
  final double? spaceBetweenIconAndText;
  final double? spaceBetweenTitleAndTime;
  final double? spaceBetweenContentAndDivider;
  final double? dividerHeight;
  final bool showDivider;
  final bool showMoreOption;
  final String? moreOptionIcon;
  final GlobalKey? moreKey;

  const NotificationCard({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.time,
    this.onMoreTap,
    this.iconBackgroundColor,
    this.titleColor,
    this.timeColor,
    this.dividerColor,
    this.iconSize,
    this.titleFontSize,
    this.timeFontSize,
    this.titleFontWeight,
    this.timeFontWeight,
    this.topMargin,
    this.bottomMargin,
    this.iconPadding,
    this.spaceBetweenIconAndText,
    this.spaceBetweenTitleAndTime,
    this.spaceBetweenContentAndDivider,
    this.dividerHeight,
    this.showDivider = true,
    this.showMoreOption = true,
    this.moreOptionIcon,
    this.moreKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: bottomMargin ?? 10.h,
        top: topMargin ?? 10.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Icon Container
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: iconSize ?? 40.w,
                  height: iconSize ?? 40.h,
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(iconPadding ?? 10.0),
                    child: SvgPicture.asset(
                      iconAsset,
                      colorFilter: ColorFilter.mode(
                        AppColor.darkColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: spaceBetweenIconAndText ?? 8.w),
              // Text Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: title,
                      textColor: titleColor ?? AppColor.textColor,
                      fontSize: titleFontSize ?? 14.sp,
                      fontWeight: titleFontWeight ?? FontWeight.w500,
                    ),
                    SizedBox(height: spaceBetweenTitleAndTime ?? 4.h),
                    CommonText(
                      text: time,
                      textColor: timeColor ?? AppColor.textColor,
                      fontSize: timeFontSize ?? 12.sp,
                      fontWeight: timeFontWeight ?? FontWeight.w400,
                    ),
                  ],
                ),
              ),
              // More Option Icon
              if (showMoreOption)
                InkWell(
                  key: moreKey,
                  onTap: onMoreTap,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      moreOptionIcon ?? AppIcons.moreOption,
                    ),
                  ),
                ),
            ],
          ),
          if (showDivider) ...[
            SizedBox(height: spaceBetweenContentAndDivider ?? 10.h),
            Divider(
              height: dividerHeight ?? 1.h,
              color: dividerColor ?? AppColor.textColor.withValues(alpha: .19),
            ),
          ],
        ],
      ),
    );
  }
}

/* 
Usage Examples:

// Basic usage:
NotificationCard(
  iconAsset: AppIcons.blackStar,
  title: "You have received a new review",
  time: "10 minutes ago",
  onMoreTap: () {
    // Handle more option tap
  },
)

// With custom styling:
NotificationCard(
  iconAsset: AppIcons.blackStar,
  title: "You have received a new review",
  time: "10 minutes ago",
  onMoreTap: () {},
  iconBackgroundColor: AppColor.secondaryColor,
  titleColor: AppColor.textColor,
  timeColor: AppColor.textColor,
  iconSize: 40.w,
  titleFontSize: 14.sp,
  timeFontSize: 12.sp,
  titleFontWeight: FontWeight.w500,
  timeFontWeight: FontWeight.w400,
)

// Without divider:
NotificationCard(
  iconAsset: AppIcons.notification,
  title: "New appointment booked",
  time: "2 hours ago",
  showDivider: false,
)

// Without more option:
NotificationCard(
  iconAsset: AppIcons.calendar,
  title: "Reminder: Meeting at 3 PM",
  time: "1 hour ago",
  showMoreOption: false,
)

// Multiple notifications in ListView:
ListView.builder(
  itemCount: notifications.length,
  itemBuilder: (context, index) {
    return NotificationCard(
      iconAsset: notifications[index].icon,
      title: notifications[index].title,
      time: notifications[index].time,
      onMoreTap: () {
        // Handle tap
      },
    );
  },
)
*/
