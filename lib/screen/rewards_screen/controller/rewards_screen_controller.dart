import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';

import '../../../core/api_endpoints/api_endpoints.dart';

class RewardsScreenController extends GetxController {
  //! Variables
  RxInt selectedIndex = 0.obs;
  RxList<RewardsItemModel> allRewardList = <RewardsItemModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getReward();
  }

  Future<void> getReward() async {
    isLoading.value = true;
    final response = await DioService.instance.request(
      input: RequestInput(endpoint: ApiEndpoints.globalReward, method: .GET),
      responseBuilder: (data) {
        final list = (data as List<dynamic>)
            .map((e) => RewardsItemModel.fromJson(e))
            .toList();
        allRewardList.addAll(list);
      },
    );
    isLoading.value = false;

    if (!response.isSuccess) {
      showSnackBar(response.message ?? '', type: SnackBarType.error);
    }
  }
}
