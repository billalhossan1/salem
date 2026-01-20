import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonText(
        text: "Onboarding Screen",
        fontSize: 24.w,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
