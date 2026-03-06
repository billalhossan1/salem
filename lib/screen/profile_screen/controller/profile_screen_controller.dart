import 'dart:io';

import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/profile_screen/model/profile_details_model.dart';

import '../../../core/api_endpoints/api_endpoints.dart';

class ProfileScreenController extends GetxController {
  RxBool isNotificationEnabled = true.obs;
  RxBool isLoading = false.obs;
  RxBool updateIsLoading = false.obs;
  Rx<ProfileModel> profileModel = ProfileModel.empty().obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;
    updateProfile(notification: value);
  }

  Future<void> getProfile({bool isNotification = false}) async {
    isNotification?isLoading.value=false:isLoading.value = true;
    await DioService.instance.request(
      input: RequestInput(endpoint: ApiEndpoints.getProfile, method: .GET),
      responseBuilder: (data) {
        profileModel.value = ProfileModel.fromJson(data);
        isNotificationEnabled.value = profileModel.value.notification;
      },
    );
    isLoading.value = false;
  }
  Future<void> updateProfile({
    String? name,
    File? image,
    String? email,
    bool? notification,
  }) async {
    updateIsLoading.value = true;

    // Create JSON body dynamically, only include non-null values
    final Map<String, dynamic> jsonBody = {};
    if (name != null) jsonBody['name'] = name;
    if (email != null) jsonBody['email'] = email;
    if (notification != null) jsonBody['notification'] = notification;

    // If you want to handle image, you might need multipart/form-data separately
    if (image != null) {
      // Example using FormData for Dio
      // jsonBody['image'] = await MultipartFile.fromFile(image.path);
    }

    final response =await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.updateProfile,
        method: .PATCH,
        jsonBody: jsonBody,
      ),
      responseBuilder: (data) {
        // Handle response
      },
    );

    updateIsLoading.value = false;
    if(response.isSuccess){
      showSnackBar(response.message??"Profile Update Successfully", type: SnackBarType.success);
      getProfile(isNotification: true);

    }
  }
}
