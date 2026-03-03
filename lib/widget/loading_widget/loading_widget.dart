import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: SizedBox(
          width: 22.w,
          height: 22.h,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: AppColor.charocalColor,
          ),
        ),
      ),
    );
  }
}