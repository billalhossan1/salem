import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/models/lat_long.dart';
import 'package:zena_app/core/services/location_service.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/screen/home_screen/repo/home_repo.dart';

class HomeScreenController extends GetxController {
  final homeRepo = HomeRepo();

  RxList<RewardsItemModel> rewardList = <RewardsItemModel>[].obs;
  RxBool isRewardLoading = false.obs;
  Rx<LatLong> currentLocation = LatLong(lat: 0, long: 0).obs;
  RxBool isLocationLoading = false.obs;

  @override
  void onInit() {
    getRewards();
    getCurrentLocation();
    super.onInit();
  }

  Future<void> getCurrentLocation() async {
    isLocationLoading.value = true;
    final position = await LocationService.getCurrentPosition();
    if (position != null) {
      currentLocation.value = LatLong(
        lat: position.latitude,
        long: position.longitude,
      );
    }
    isLocationLoading.value = false;
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
