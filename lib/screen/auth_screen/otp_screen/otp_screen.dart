import 'package:core_kit/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_images/app_images.dart';

class OptScreen extends StatelessWidget {
  const OptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bankgroundImages),
                fit: BoxFit.cover,
              ),
            ),
          ),

        Center(child: CommonText(text: "Otp Screen"),)
        ],
      ),
    );
  }
}