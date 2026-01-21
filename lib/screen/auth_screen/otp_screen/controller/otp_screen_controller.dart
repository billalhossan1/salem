import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final RxString otpCode = ''.obs;
  final FocusNode focusNode = FocusNode();
  final RxInt secondsRemaining = 55.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
    // Listen to changes in the text field
    otpController.addListener(() {
      otpCode.value = otpController.text;
      if (otpCode.value.length == 4) {
        focusNode.unfocus();
      }
    });
  }

  void startTimer() {
    _timer?.cancel();
    secondsRemaining.value = 55;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void onClose() {
    otpController.dispose();
    focusNode.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
