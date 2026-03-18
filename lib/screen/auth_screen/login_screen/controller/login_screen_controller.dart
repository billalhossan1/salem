import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/utils/shared_prefe.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;
  late TextEditingController phoneNumberController;
  var countryCode = '+971'.obs; // Default country code

  /// Referral code passed via deep link (may be empty)
  RxString referralCode = ''.obs;

  @override
  void onInit() {
    phoneNumberController = TextEditingController();
    // Read referral code from deep-link arguments if available
    final args = Get.arguments;
    if (args is Map && args['referralCode'] != null) {
      referralCode.value = args['referralCode'].toString();
      AppLogger.debug(
        'LoginScreen: referral code from deep link = "${referralCode.value}"',
        tag: 'Login',
      );
    }
    super.onInit();
  }

  void onCountryChange(String code) {
    countryCode.value = code;
  }

  Future<void> login() async {
    isLoading.value = true;
    final response = await DioService.instance.request<dynamic>(
      input: RequestInput(
        endpoint: ApiEndpoints.sendOtp,
        method: RequestMethod.POST,
        jsonBody: {
          // "phoneNumber": phoneNumberController.text.trim(),
          "phoneNumber": countryCode+phoneNumberController.text.trim(),
          if (referralCode.value.isNotEmpty) "referralCode": referralCode.value,
        },
      ),
      responseBuilder: (data) {
        return data;
      },
      showMessage: true,
    );
    isLoading.value = false;
    // SharePrefsHelper.setString(SharedPreferenceValue.token, response.data['accessToken']);
    // SharePrefsHelper.setString(SharedPreferenceValue.refreshToken, response.data['refreshToken']);
    // SharePrefsHelper.setString(SharedPreferenceValue.userId, response.data['userId']);
    // AppLogger.apiDebug(response.data.toString());
    // AppLogger.apiDebug(response.data['accessToken'].toString());
    // AppLogger.apiDebug(response.data['userId'].toString());

    if (response.isSuccess) {
      Get.toNamed(AppRoute.otpScreen,arguments: phoneNumberController.text.trim());
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}
