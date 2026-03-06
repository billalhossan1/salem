import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/profile_screen/model/profile_details_model.dart';

import '../../../core/api_endpoints/api_endpoints.dart';

class ProfileScreenController extends GetxController {
  RxBool isNotificationEnabled = true.obs;
  RxBool isLoading = false.obs;
  Rx<ProfileModel> profileModel = ProfileModel.empty().obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;
  }

  Future<void> getProfile() async {
    isLoading.value = true;
    await DioService.instance.request(
      input: RequestInput(endpoint: ApiEndpoints.getProfile, method: .GET),
      responseBuilder: (data) {
        profileModel.value = ProfileModel.fromJson(data);
        isNotificationEnabled.value = profileModel.value.notification;
      },
    );
    isLoading.value = false;
  }
}
