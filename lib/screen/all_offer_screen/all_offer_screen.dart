import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/screen/all_offer_screen/controller/all_offer_screen_controller.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/widget/app_custom_appbar/app_custom_appbar.dart';
import 'package:zena_app/widget/notificaiton_widget/notification_widget.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../widget/shimmer/app_shimmer.dart';

class AllOfferScreen extends StatelessWidget {
  const AllOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllOfferScreenController>();

    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: 'Exclusive Offer'.tr,
        leadingType: LeadingType.back,
        centerTitle: true,
        actions: [NotificationWidget()],
      ),
      body: Obx(() {
        final isLoading = controller.isLoading.value;
        final isDone = controller.isLoadDone.value;
        final items = controller.allOfferList;

        if (isLoading && items.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: const _OfferListCardShimmer(),
                  ),
                ),
              ),
            ),
          );
        }

        if (!isLoading && items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.card_giftcard_outlined,
                  size: 64,
                  color: AppColor.textColor.withValues(alpha: 0.3),
                ),
                16.height,
                CommonText(
                  text: 'No offers available'.tr,
                  fontSize: 16.w,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.textColor,
                ),
              ],
            ),
          );
        }

        return SmartListLoader(
          isLoading: isLoading,
          isLoadDone: isDone,
          onRefresh: controller.onRefresh,
          onLoadMore: controller.onLoadMore,
          itemCount: items.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          itemBuilder: (context, index) {
            final offer = items[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: _OfferListCard(offer: offer),
            );
          },
        );
      }),
    );
  }
}

class _OfferListCard extends StatelessWidget {
  final RewardsItemModel offer;
  const _OfferListCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.creamColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: offer.rewardImage.isNotEmpty
                ? CommonImage(
                    src: offer.rewardImage,
                    height: 180.h,
                    width: double.infinity,
                    fill: BoxFit.cover,
                  )
                : Container(
                    height: 180.h,
                    width: double.infinity,
                    color: AppColor.secondaryColor.withValues(alpha: 0.15),
                    child: Icon(
                      Icons.card_giftcard,
                      size: 50,
                      color: AppColor.secondaryColor,
                    ),
                  ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: offer.rewardName,
                  fontSize: 18.w,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.darkColor,
                ),
                4.height,
                CommonText(
                  text: offer.description,
                  maxLines: 2,
                  isDescription: true,
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textColor,
                ),
                16.height,
                Row(
                  children: [
                    // Points badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.secondaryColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: AppColor.secondaryColor,
                          ),
                          4.width,
                          CommonText(
                            text: '${offer.rewardPoints} ${"points".tr}',
                            fontSize: 13.w,
                            fontWeight: FontWeight.w600,
                            textColor: AppColor.secondaryColor,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // View Details button
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoute.rewardDetailsScreen,
                          arguments: {'rewardId': offer.id},
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CommonText(
                          text: 'View Details'.tr,
                          fontSize: 14.w,
                          fontWeight: FontWeight.w500,
                          textColor: AppColor.darkColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OfferListCardShimmer extends StatelessWidget {
  const _OfferListCardShimmer();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.creamColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Container(
                height: 180.h,
                width: double.infinity,
                color: AppColor.secondaryColor.withValues(alpha: 0.15),
              ),
            ),
            // Content placeholders
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title line
                  Container(
                    height: 18.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor
                          .withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  8.height,
                  // Description lines
                  Container(
                    height: 14.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor
                          .withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  4.height,
                  Container(
                    height: 14.h,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor
                          .withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  16.height,
                  Row(
                    children: [
                      // Points badge placeholder
                      Container(
                        height: 28.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: AppColor.secondaryColor
                              .withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const Spacer(),
                      // Button placeholder
                      Container(
                        height: 32.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor
                              .withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
