import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';

import '../../../core/api_endpoints/api_endpoints.dart';
import '../../rewards_screen/model/reward_history_model.dart';

class ViewHistoryController extends GetxController {
  RxBool usedRewardIsLoading = false.obs;
  RxBool isLoadDone = false.obs;

  Rx<Salon> salon = Salon.empty().obs;
  RxList<History> historyList = <History>[].obs;

  String salonId = '';

  static const int _limit = 10;

  @override
  void onInit() {
    salonId = Get.arguments['salonId'] ?? '';
    getUsedReward(1);
    super.onInit();
  }

  Future<void> getUsedReward(int page) async {
    if (usedRewardIsLoading.value || isLoadDone.value) return;

    usedRewardIsLoading.value = true;

    final response = await DioService.instance.request(
      input: RequestInput(
        endpoint: "${ApiEndpoints.getRewardHistory}/$salonId",
        method: .GET,
        queryParams: {'page': page, 'limit': _limit},
      ),
      responseBuilder: (data) => RewardHistoryModel.fromJson(data),
    );

    usedRewardIsLoading.value = false;

    if (response.isSuccess && response.data != null) {
      final model = response.data!;
      if (page == 1) {
        salon.value = model.salon;
        historyList.assignAll(model.history);
      } else {
        historyList.addAll(model.history);
      }
      if (model.history.length < _limit) {
        isLoadDone.value = true;
      }
    } else {
      showSnackBar(response.message ?? '', type: SnackBarType.error);
    }
  }

  void onRefresh() {
    isLoadDone.value = false;
    historyList.clear();
    getUsedReward(1);
  }

  void onLoadMore(int page) {
    getUsedReward(page);
  }
}
