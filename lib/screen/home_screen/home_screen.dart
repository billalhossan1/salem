import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.successColor,
      body: Center(child: CommonText(text: "Home Screen")),
    );
  }
}
