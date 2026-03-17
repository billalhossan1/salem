import 'dart:async';

import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/core/services/location_controller.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/screen/home_screen/repo/home_repo.dart';
import 'package:zena_app/service/socket_service.dart';
import 'package:zena_app/utils/shared_prefe.dart';

import '../../../service/steam_data_model.dart';
import '../../notificaton_screen/model/notificationItemModel.dart';
import '../../profile_screen/controller/profile_screen_controller.dart';

class HomeScreenController extends GetxController {
  final homeRepo = HomeRepo();

  RxList<RewardsItemModel> rewardList = <RewardsItemModel>[].obs;
  final profileController = Get.find<ProfileScreenController>();
  RxBool isRewardLoading = false.obs;
  String userId = '';
  RxInt count = 0.obs;
  late StreamSubscription<StreamDataModel> subscription;
  String fcmToken = '';
  @override
  void onInit() {
    super.onInit();

    _initial();
  }

  Future<void> _initial() async {
    // Wait until LocationController finishes its one-time fetch
    // before firing any API call.
    fcmToken = await SharePrefsHelper.getString(SharedPreferenceValue.fcmToken);
    updateFcm();
    notificationCount();
    await LocationController.instance.ready;
    getRewards();
    userId = await SharePrefsHelper.getString(SharedPreferenceValue.userId);
    SocketService.instance.connect(id: userId);
    subscription = SocketService.instance.streamController.stream.listen((
        event,
        ) {

      if (event.streamType == StreamType.notification) {
        count++;
        // AppLogger.apiDebug("+============notification${count.value}");
      }
    });

  }

  Future<void>updateFcm()async{
    final Map<String, dynamic> jsonBody = {
      'fcmToken': fcmToken,
    };
   await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.updateProfile,
        method: .PATCH,
        jsonBody: jsonBody,
      ),
      responseBuilder: (data) {

      },
    );
   AppLogger.apiDebug("fcm token updated");



  }

  Future<void> getRewards() async {
    isRewardLoading.value = true;
    final result = await homeRepo.getAllRewards();
    isRewardLoading.value = false;

    if (result.isSuccess) {
      rewardList.addAll(result.data ?? []);
      AppLogger.apiDebug(rewardList[0].rewardName.toString());
    }
  }

  Future<void> notificationCount() async {
    await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.notificationCount,
        method: .GET,
      ),
      responseBuilder: (data) {
        // AppLogger.apiDebug("==================notificaiton count:${data}");
        // AppLogger.apiDebug("==================notificaiton count:${int.parse(data)}");
        count.value = data;
        // AppLogger.apiDebug("==================notificaiton count:${count.value}");

      },
    );
  }
}
