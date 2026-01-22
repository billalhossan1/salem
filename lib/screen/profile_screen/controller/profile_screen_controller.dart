import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  RxBool isNotificationEnabled = true.obs;

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;
  }
}
