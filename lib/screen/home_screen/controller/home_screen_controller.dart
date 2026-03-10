import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/services/location_controller.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/screen/home_screen/repo/home_repo.dart';

class HomeScreenController extends GetxController {
  final homeRepo = HomeRepo();

  RxList<RewardsItemModel> rewardList = <RewardsItemModel>[].obs;
  RxBool isRewardLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initial();
  }

  Future<void> _initial() async {
    // Wait until LocationController finishes its one-time fetch
    // before firing any API call.
    await LocationController.instance.ready;
    getRewards();
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


