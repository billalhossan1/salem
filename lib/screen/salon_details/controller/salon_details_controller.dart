import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/core/models/lat_long.dart';
import 'package:zena_app/core/services/location_service.dart';
import 'package:zena_app/screen/salon_screen/model/salon_item_model.dart';

class SalonDetailsController extends GetxController {
  final isLoading = true.obs;
  final isConfirmVisitLoading = false.obs;
  String salonId = '';
  Rx<SalonItemModel> salon = SalonItemModel.empty().obs;
  // Current location — refreshed on every confirmVisit press
  Rx<LatLong> currentLocation = LatLong(lat: 0, long: 0).obs;
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
  Future<void> confirmVisit() async {
    // ── 1. Get / re-request location ──────────────────────────────────────
    final position = await LocationService.getCurrentPosition();

    if (position == null) {
      // Permission denied or service disabled — LocationService already
      // handles the "permanently denied → open settings" dialog.
      // Show an extra hint so the user knows why the action was blocked.
      showSnackBar(
        'Location access is required to confirm a visit. Please allow location permission and try again.',
        type: SnackBarType.warning,
      );
      return;
    }

    // ── 2. Cache the fresh location ───────────────────────────────────────
    currentLocation.value = LatLong(
      lat: position.latitude,
      long: position.longitude,
    );

    // ── 3. Confirm visit API call ─────────────────────────────────────────
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
}
