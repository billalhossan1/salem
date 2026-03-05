import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/screen/salon_screen/model/salon_item_model.dart';

class SalonDetailsController extends GetxController {
  final isLoading = true.obs;
  String salonId = '';
  Rx<SalonItemModel> salon = SalonItemModel.empty().obs;
  // RxList<RewardsItemModel> rewardList = <RewardsItemModel>[].obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args is SalonItemModel) {
      salonId = args.id;
    } else if (args is Map) {
      salonId = args['salonId']?.toString() ?? '';
    }
    getSingleSalonById();
    super.onInit();
  }

  Future<void> getSingleSalonById() async {
    isLoading.value = true;
     await DioService.instance.request(
      input: RequestInput(
        endpoint: '${ApiEndpoints.salonList}/$salonId',
        method: .GET,
      ),
      responseBuilder: (data) {
        salon.value = SalonItemModel.fromJson(data);
      },
    );

    isLoading.value = false;
  }

  // Future<void> getRewardsBySalonId() async {
  //   isLoading.value = true;
  //  await DioService.instance.request(
  //     input: RequestInput(
  //       endpoint: ApiEndpoints.getRewards,
  //       method: .GET,
  //       queryParams: {'salonId': salonId},
  //     ),
  //     responseBuilder: (data) {
  //       rewardList.addAll(
  //         data.map((e) => RewardsItemModel.fromJson(e)).toList(),
  //       );
  //     },
  //   );
  //
  //   isLoading.value = false;
  // }
}
