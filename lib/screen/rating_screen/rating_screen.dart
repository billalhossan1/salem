import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:flutter/material.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/utils/app_colors/app_colors.dart';
import 'package:zena_app/widget/app_custom_appbar/app_custom_appbar.dart';
import 'package:get/get.dart';
import 'package:zena_app/widget/loading_widget/loading_widget.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int rating = 4;
  String salonName = '';
  String service = '';
  String salonId = '';
  final TextEditingController commentController = TextEditingController();
  @override
  void initState() {
    salonName = Get.arguments['name'] ?? '';
    service = Get.arguments['service'] ?? '';
    salonId = Get.arguments['salonId'] ?? '';
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenBackgroundColor,
      appBar: AppCustomAppbar(
        title: "Review",
        leadingType: LeadingType.back,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            12.height,
            CommonText(
              text: salonName.tr,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              textColor: AppColor.darkColor,
            ),
            6.height,
            CommonText(
              text: service.tr,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              textColor: AppColor.secondaryColor,
            ),
            28.height,
            CommonText(
              text: "Give Overall Rating".tr,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textColor: AppColor.darkColor,
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final starIndex = index + 1;
                final isSelected = rating >= starIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      rating = starIndex;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Icon(
                      Icons.star_rounded,
                      size: 32.sp,
                      color: isSelected
                          ? AppColor.warningColor
                          : AppColor.textColor.withValues(alpha: 0.2),
                    ),
                  ),
                );
              }),
            ),
            32.height,
            Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                text: "Comment".tr,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                textColor: AppColor.darkColor,
              ),
            ),
            12.height,
            CommonMultilineTextField(
              validationType: .notRequired,
              hintText: "Enter your comment here...".tr,
              maxLength: 150,
              height: 150,
              controller: commentController,
            ),
            32.height,
            isLoading
                ? LoadingWidget()
                : CommonButton(
                    titleText: "Send Review".tr,
                    buttonWidth: double.infinity,
                    buttonRadius: 12.w,
                    buttonColor: AppColor.primaryColor,
                    titleColor: AppColor.darkColor,
                    titleSize: 16.sp,
                    titleWeight: FontWeight.w500,
                    onTap: () {
                      _giveReview();
                    },
                  ),
          ],
        ),
      ),
    );
  }

  bool isLoading = false;
  Future<void> _giveReview() async {
    isLoading = true;
    setState(() {});
    final response = await DioService.instance.request(
      input: RequestInput(
        endpoint: "${ApiEndpoints.rating}/$salonId",
        method: .POST,
        jsonBody: {"rating": rating, "comment": commentController.text},
      ),
      responseBuilder: (data) {},
      showMessage: true,
    );
    isLoading = false;
    setState(() {});
    if (response.isSuccess) {
      Get.back();
    }
  }
}
