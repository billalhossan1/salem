import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/invite_history/controller/invite_history_controller.dart';
import '../../utils/app_colors/app_colors.dart';
import '../../widget/app_custom_appbar/app_custom_appbar.dart';

class InviteHistoryScreen extends StatelessWidget {
  const InviteHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InviteHistoryController());

    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Invite History",
        leadingType: LeadingType.back,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Summary Cards
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          decoration: BoxDecoration(
                            color: Color(0xFFFDE8F1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "TOTAL INVITES".tr,
                                style: TextStyle(
                                  color: Color(0xFF6E6E6E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              8.height,
                              Text(
                                "12 Friends".tr,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      16.width,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFBE8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "COMPLETED".tr,
                                style: TextStyle(
                                  color: Color(0xFF6E6E6E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              8.height,
                              Text(
                                "5 Successful".tr,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  24.height,

                  // Recent Activity Title
                  CommonText(
                    text: "Recent Activity".tr,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xFF333333),
                  ),
                  16.height,

                  // List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.recentActivity.length,
                    separatorBuilder: (context, index) => 12.height,
                    itemBuilder: (context, index) {
                      final item = controller.recentActivity[index];
                      return Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: item.avatarColor,
                              child: Text(
                                item.name[0],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ),
                            12.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: item.name,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  textColor: Color(0xFF333333),
                                ),
                                4.height,
                                CommonText(
                                  text: item.joinDate,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  textColor: Color(0xFF6E6E6E),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.secondaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                      4.width,
                                      Text(
                                        item.points,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                8.height,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE4F2EA),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    item.status,
                                    style: TextStyle(
                                      color: AppColor.successColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Bottom Button
          Container(
            padding: EdgeInsets.all(26),
            decoration: BoxDecoration(color: AppColor.screenBackgroundColor),
            child: CommonButton(
              titleText: "Share Referral Link".tr,
              buttonColor: AppColor.primaryColor,
              titleColor: AppColor
                  .darkColor, // Using dark color for contrast on light green
              prefix: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.share_outlined,
                  color: AppColor.darkColor,
                  size: 20,
                ),
              ),
              buttonRadius: 12,
              buttonWidth: double.infinity,
              onTap: () {
                // Action
              },
            ),
          ),
        ],
      ),
    );
  }
}
