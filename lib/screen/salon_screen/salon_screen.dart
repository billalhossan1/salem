import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors/app_colors.dart';

class SalonScreen extends StatelessWidget {
  const SalonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: CommonText(text: "Salon Screen"),
      ),
    );
  }
}