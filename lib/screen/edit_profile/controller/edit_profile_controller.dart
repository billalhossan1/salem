import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/profile_screen/controller/profile_screen_controller.dart';

class EditProfileController extends GetxController {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  var profile = Get.find<ProfileScreenController>();

  // ── Picked image ───────────────────────────────────────────────
  final Rxn<XFile> pickedImage = Rxn<XFile>();

  void pickImage(XFile file) {
    pickedImage.value = file;
  }

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController(
      text: profile.profileModel.value.name,
    );
    emailController = TextEditingController(
      text: profile.profileModel.value.email,
    );
    phoneController = TextEditingController(
      text: profile.profileModel.value.phoneNumber,
    );
  }

  @override
  void onClose() {
    // fullNameController.dispose();
    // emailController.dispose();
    // phoneController.dispose();
    super.onClose();
  }

  void onTapSaved() {
    profile.updateProfile(
      email: emailController.text.trim(),
      name: fullNameController.text.trim(),
      image: pickedImage.value,
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
