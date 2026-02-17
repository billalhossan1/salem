import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final TextEditingController phoneNumberController = TextEditingController();
  var countryCode = '+880'.obs; // Default country code

  void onCountryChange(String code) {
    countryCode.value = code;
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}