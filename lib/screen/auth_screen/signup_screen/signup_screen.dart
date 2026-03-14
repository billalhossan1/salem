import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/auth_screen/signup_screen/controller/signup_controller.dart';
import 'package:zena_app/screen/auth_screen/signup_screen/entity/signup_entity.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Sign Up"),
      body: FormBuilder(
        entity: SignupEntity(),
        builder: (context, formKey, entity) {
          return Column(
            children: [
              SizedBox(height: 16.w),
              CommonText(text: "Full name".tr),
              8.height,
              CommonTextField(
                hintText: 'Enter your full name'.tr,
                onSaved: (value, controller) => entity.fullName = value,
                validationType: ValidationType.validateFullName,
              ),

              CommonButton(
                titleText: "Submit".tr,
                onTap: () {
                  formKey.currentState?.save();
                  if (formKey.currentState?.validate() ?? false) {
                    Get.find<SignupController>().signup(entity);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
