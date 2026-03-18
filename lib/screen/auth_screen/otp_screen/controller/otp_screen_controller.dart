import 'dart:async';
import 'package:core_kit/core_kit.dart' show DioService;
import 'package:core_kit/network/request_input.dart';
import 'package:core_kit/utils/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/core/app_route/app_route.dart';

import '../../../../utils/shared_prefe.dart';

class OtpScreenController extends GetxController {
  late TextEditingController otpController;
  final RxString otpCode = ''.obs;
  String phone = '';
  final FocusNode focusNode = FocusNode();
  final RxInt secondsRemaining = 55.obs;
  Timer? _timer;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments;
    otpController = TextEditingController();
    startTimer();
    //Listen to changes in the text field
    otpController.addListener(() {
      otpCode.value = otpController.text;
      if (otpCode.value.length == 4) {
        focusNode.unfocus();
      }
    });
  }

  Future<void> onTapVerify() async {
    isLoading.value = true;
    final response = await DioService.instance.request(
      input: RequestInput(endpoint: ApiEndpoints.login, method: .POST,jsonBody: {
        "phoneNumber":"+971${phone}",
        "otp":otpCode.value,
      }),
      responseBuilder: (data) {
        SharePrefsHelper.setString(SharedPreferenceValue.token, data['accessToken']);
        SharePrefsHelper.setString(SharedPreferenceValue.refreshToken, data['refreshToken']);
        SharePrefsHelper.setString(SharedPreferenceValue.userId, data['userId']);
        AppLogger.apiDebug( data['accessToken']);
        AppLogger.apiDebug(data['userId']);
      },showMessage: true,
    );
    if(response.isSuccess){
      Get.toNamed(AppRoute.bottomNav);
    }


    isLoading.value = false;


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
    //otpController.dispose();
    focusNode.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
