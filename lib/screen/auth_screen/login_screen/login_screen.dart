import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_string/app_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

          Center(child: CommonText(text: AppString.contineu)),
        ],
      ),
    );
  }
}
