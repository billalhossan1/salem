import 'dart:async';

import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/core/services/location_controller.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/screen/home_screen/repo/home_repo.dart';
import 'package:zena_app/service/socket_service.dart';

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
  @override
  void onInit() {
    super.onInit();
    subscription =  SocketService.instance.streamController.stream.listen((event) {
      if(event.streamType == StreamType.notification && Get.currentRoute !=  AppRoute.notificationScreen){
        final notification = event.data as NotificationItemModel;

        count.value++;
      }

    });
    _initial();
  }

  Future<void> _initial() async {
    // Wait until LocationController finishes its one-time fetch
    // before firing any API call.
    await LocationController.instance.ready;
    getRewards();
    userId = profileController.profileModel.value.id;
    SocketService.instance.connect(id: userId);

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
}


