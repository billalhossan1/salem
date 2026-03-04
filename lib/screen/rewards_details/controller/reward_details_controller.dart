import 'package:core_kit/utils/app_log.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';

import '../../home_screen/repo/home_repo.dart';

class RewardDetailsController extends GetxController {
  Rxn<RewardsItemModel>reward = Rxn<RewardsItemModel>();
  final homeRepo = HomeRepo();
  RxBool isRewardLoading = false.obs;
  String rewardId = '';

  @override
  void onInit() {
    rewardId = Get.arguments['rewardId']??'';
    getRewardById();
    super.onInit();
  }

  Future<void> getRewardById() async {
    isRewardLoading.value = true;
    final result = await homeRepo.getSingleReward(rewardId: rewardId);
    isRewardLoading.value = false;

    if (result.isSuccess) {
      reward.value = result.data;
      AppLogger.apiDebug(reward.value!.rewardName.toString());
    }
  }
}
