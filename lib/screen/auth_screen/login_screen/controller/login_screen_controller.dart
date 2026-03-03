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
  var countryCode = '+880'.obs; // Default country code

  @override
  void onInit() {
    phoneNumberController = TextEditingController();
    super.onInit();
  }



  void onCountryChange(String code) {
    countryCode.value = code;
  }


  Future<void> login() async {
    isLoading.value = true;
    final response = await DioService.instance.request<dynamic>(
      input: RequestInput(
        endpoint: ApiEndpoints.login,
        method: RequestMethod.POST,
        jsonBody: {
          "phoneNumber": "01335588522",
        }
      ),
      responseBuilder: (data) {
        return data;
      },
      showMessage: true
    );
    isLoading.value = false;
    SharePrefsHelper.setString(SharedPreferenceValue.token, response.data['accessToken']);
    SharePrefsHelper.setString(SharedPreferenceValue.refreshToken, response.data['refreshToken']);
    AppLogger.apiDebug(response.data.toString());
    AppLogger.apiDebug(response.data['accessToken'].toString());

    if(response.isSuccess){
      Get.toNamed(AppRoute.bottomNav);
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}
