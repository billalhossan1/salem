import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';

class AllOfferScreenController extends GetxController {
  RxList<RewardsItemModel> allOfferList = <RewardsItemModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadDone = false.obs;

  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  Future<void> onRefresh() async {
    allOfferList.clear();
    isLoadDone.value = false;
    await getAllOffer(page: 1);
  }

  Future<void> onLoadMore(int page) async {
    if (isLoadDone.value || isLoading.value) return;
    await getAllOffer(page: page);
  }

  Future<void> getAllOffer({int page = 1, int limit = 10}) async {
    if (isLoading.value) return;
    isLoading.value = true;

    final result = await DioService.instance.request<List<RewardsItemModel>>(
      input: RequestInput(
        endpoint: ApiEndpoints.getRewards,
        method: RequestMethod.GET,
        queryParams: {'page': page, 'limit': limit},
      ),
      responseBuilder: (data) {
        if (data is List) {
          return data.map((e) => RewardsItemModel.fromJson(e)).toList();
        }
        // Handle paginated response wrapper e.g. { data: [...], total: N }
        final list = data['data'] ?? data['rewards'] ?? data;
        if (list is List) {
          return list.map((e) => RewardsItemModel.fromJson(e)).toList();
        }
        return <RewardsItemModel>[];
      },
    );

    isLoading.value = false;

    if (result.isSuccess) {
      final items = result.data ?? [];
      if (items.isEmpty || items.length < limit) {
        isLoadDone.value = true;
      }
      allOfferList.addAll(items);
    }
  }
}
