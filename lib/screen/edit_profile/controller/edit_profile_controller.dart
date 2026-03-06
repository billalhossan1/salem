import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/profile_screen/controller/profile_screen_controller.dart';

class EditProfileController extends GetxController {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  var profile =Get.find<ProfileScreenController>();

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController(text: profile.profileModel.value.name);
    emailController = TextEditingController(text: profile.profileModel.value.email);
    phoneController = TextEditingController(text: profile.profileModel.value.phoneNumber);
  }

  @override
  void onClose() {
    // fullNameController.dispose();
    // emailController.dispose();
    // phoneController.dispose();
    super.onClose();
  }
  void onTapSaved(){
    profile.updateProfile(
      email: emailController.text.trim(),
      name: fullNameController.text.trim(),
    );
  }


  void onCountryChange(String countryCode) {
    // Handle country code change
  }

  void saveChanges() {
    // Implement save logic here
    Get.back();
  }
}
