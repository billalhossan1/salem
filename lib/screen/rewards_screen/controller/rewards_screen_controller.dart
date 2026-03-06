import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/screen/rewards_screen/model/used_reward_model.dart';

import '../../../core/api_endpoints/api_endpoints.dart';

class RewardsScreenController extends GetxController {
  //! Tab
  RxInt selectedIndex = 0.obs;

  //! User coin
  RxInt userCoin = 0.obs;
  RxBool userCoinIsLoading = false.obs;

  //! Active rewards (Tab 0)
  RxList<RewardsItemModel> allRewardList = <RewardsItemModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isRewardLoadDone = false.obs;

  //! Used rewards (Tab 1)
  RxList<UsedRewardModel> allUsedReward = <UsedRewardModel>[].obs;
  RxBool usedRewardIsLoading = false.obs;
  RxBool isUsedLoadDone = false.obs;

  static const int _limit = 10;

  @override
  void onInit() {
    super.onInit();
    getUserCoin();
    getReward(1);
  }

  // ─── Tab switch ──────────────────────────────────────────────────────────
  void onTabChanged(int index) {
    if (selectedIndex.value == index) return;
    selectedIndex.value = index;
    if (index == 1 && allUsedReward.isEmpty) {
      getUsedReward(1);
    }
  }

  // ─── Active rewards ───────────────────────────────────────────────────────
  Future<void> getReward(int page) async {
    if (isLoading.value || isRewardLoadDone.value) return;
    isLoading.value = true;

    final response = await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.globalReward,
        method: .GET,
        queryParams: {'page': page, 'limit': _limit},
      ),
      responseBuilder: (data) {
        final list = (data as List<dynamic>)
            .map((e) => RewardsItemModel.fromJson(e))
            .toList();
        if (page == 1) {
          allRewardList.assignAll(list);
        } else {
          allRewardList.addAll(list);
        }
        if (list.length < _limit) isRewardLoadDone.value = true;
      },
    );

    isLoading.value = false;
    if (!response.isSuccess) {
      showSnackBar(response.message ?? '', type: SnackBarType.error);
    }
  }

  void onRewardRefresh() {
    isRewardLoadDone.value = false;
    allRewardList.clear();
    getReward(1);
  }

  void onRewardLoadMore(int page) => getReward(page);

  // ─── Used rewards ─────────────────────────────────────────────────────────
  Future<void> getUsedReward(int page) async {
    if (usedRewardIsLoading.value || isUsedLoadDone.value) return;
    usedRewardIsLoading.value = true;

    final response = await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.getUsedReward,
        method: .GET,
        queryParams: {'page': page, 'limit': _limit},
      ),
      responseBuilder: (data) {
        final list = (data['purchases'] as List<dynamic>)
            .map((e) => UsedRewardModel.fromJson(e))
            .toList();
        if (page == 1) {
          allUsedReward.assignAll(list);
        } else {
          allUsedReward.addAll(list);
        }
        if (list.length < _limit) isUsedLoadDone.value = true;
      },
    );

    usedRewardIsLoading.value = false;
    if (!response.isSuccess) {
      showSnackBar(response.message ?? '', type: SnackBarType.error);
    }
  }

  void onUsedRewardRefresh() {
    isUsedLoadDone.value = false;
    allUsedReward.clear();
    getUsedReward(1);
  }

  void onUsedRewardLoadMore(int page) => getUsedReward(page);

  // ─── User coin ────────────────────────────────────────────────────────────
  Future<void> getUserCoin() async {
    userCoinIsLoading.value = true;
    await DioService.instance.request(
      input: RequestInput(endpoint: ApiEndpoints.getUserCoin, method: .GET),
      responseBuilder: (data) {
        userCoin.value = data['coins'] ?? 0;
      },
    );
    userCoinIsLoading.value = false;
  }
}
