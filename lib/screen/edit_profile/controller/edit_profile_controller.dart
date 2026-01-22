import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController(text: "Salma Khatun");
    emailController = TextEditingController(text: "salmakhatun@gmail.com");
    phoneController = TextEditingController(text: "+1(555) 000-0000");
  }

  @override
  void onClose() {
    // fullNameController.dispose();
    // emailController.dispose();
    // phoneController.dispose();
    super.onClose();
  }

  void onCountryChange(String countryCode) {
    // Handle country code change
  }

  void saveChanges() {
    // Implement save logic here
    Get.back();
  }
}
