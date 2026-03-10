import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:core_kit/utils/app_log.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/models/lat_long.dart';
import 'package:zena_app/core/services/location_controller.dart';
import 'package:zena_app/core/services/location_service.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';

import '../../../core/api_endpoints/api_endpoints.dart';
import '../../home_screen/repo/home_repo.dart';

class RewardDetailsController extends GetxController {
  Rxn<RewardsItemModel> reward = Rxn<RewardsItemModel>();
  final homeRepo = HomeRepo();
  RxBool isRewardLoading = false.obs;
  RxBool isConfirmVisitLoading = false.obs;
  String rewardId = '';
  String salonId = '';
  // Last known good location — updated on each successful confirmVisit press
  Rx<LatLong> currentLocation = LatLong(lat: 0, long: 0).obs;

  @override
  void onInit() {
    rewardId = Get.arguments['rewardId'] ?? '';
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    // Wait for location before firing the API call
    await LocationController.instance.ready;
    // Seed local cache with already-fetched location
    currentLocation.value = LocationController.instance.currentLocation.value;
    getRewardById();
  }

  Future<void> confirmVisit() async {
    // ── 1. Fetch / re-request location on every press ──────────────────────
    final position = await LocationService.getCurrentPosition();

    if (position == null) {
      showSnackBar(
        'Location access is required to confirm a visit. Please allow location permission and try again.',
        type: SnackBarType.warning,
      );
      return;
    }

    // ── 2. Cache fresh coords ───────────────────────────────────────────────
    currentLocation.value = LatLong(
      lat: position.latitude,
      long: position.longitude,
    );

    // ── 3. Call API ─────────────────────────────────────────────────────────
    isConfirmVisitLoading.value = true;
    await DioService.instance.request(
      input: RequestInput(
        endpoint: '${ApiEndpoints.visitSalon}/$salonId',
        method: .POST,
        queryParams: {
          'lat1': currentLocation.value.lat,
          'lon1': currentLocation.value.long,
        },
      ),
      responseBuilder: (data) {},
      showMessage: true,
    );
    isConfirmVisitLoading.value = false;
  }

  Future<void> getRewardById() async {
    isRewardLoading.value = true;
    final result = await homeRepo.getSingleReward(rewardId: rewardId);
    isRewardLoading.value = false;

    if (result.isSuccess) {
      reward.value = result.data;
      salonId = reward.value?.salonId ?? '';
      AppLogger.apiDebug(reward.value!.rewardName.toString());
    }
  }
}


