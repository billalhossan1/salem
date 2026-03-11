import 'dart:async';

import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/service/socket_service.dart';

import '../../../core/api_endpoints/api_endpoints.dart';
import '../../../service/steam_data_model.dart';
import '../model/notificationItemModel.dart';

class NotificationScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final RxList<NotificationItemModel> notificationList =
      <NotificationItemModel>[].obs;
  late StreamSubscription<StreamDataModel> subscription;

  @override
  void onInit() {
    super.onInit();
    getAllNotification();
  subscription =  SocketService.instance.streamController.stream.listen((event) {
      if(event.streamType == StreamType.notification){
        final notification = event.data as NotificationItemModel;
         notificationList.insert(0, notification);
      }

    });
  }

  @override
  void onClose(){
    subscription.cancel();
    return super.onClose();
  }

  Future<void> getAllNotification({int page = 1}) async {
    if (page == 1) {
      isLoading.value = true;
    }
    await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.getAllNotification,
        method: .GET,
        queryParams: {'page': page, 'limit': 10},
      ),
      responseBuilder: (data) {
        final list = (data as List<dynamic>)
            .map((e) => NotificationItemModel.fromJson(e))
            .toList();
        if (page == 1) {
          notificationList.clear();
        }
        notificationList.addAll(list);
      },
    );
    if (page == 1) {
      isLoading.value = false;
    }
  }


}
