import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors/app_colors.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Center(
        child: CommonText(text: "Rewards Screen"),
      ),
    );
  }
}