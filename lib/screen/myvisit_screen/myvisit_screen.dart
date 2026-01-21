import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors/app_colors.dart';

class MyvisitScreen extends StatelessWidget {
  const MyvisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.warningColor,
      body: Center(child: CommonText(text: "Myvisit Screen")),
    );
  }
}
