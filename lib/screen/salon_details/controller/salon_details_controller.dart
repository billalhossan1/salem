import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/core/models/lat_long.dart';
import 'package:zena_app/core/services/location_controller.dart';
import 'package:zena_app/core/services/location_service.dart';
import 'package:zena_app/screen/salon_screen/model/salon_item_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SalonDetailsController extends GetxController {
  final isLoading = true.obs;
  final isConfirmVisitLoading = false.obs;
  String salonId = '';
  Rx<SalonItemModel> salon = SalonItemModel.empty().obs;

  // Current location — refreshed on every confirmVisit press
  Rx<LatLong> currentLocation = LatLong(lat: 0, long: 0).obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args is SalonItemModel) {
      salonId = args.id;
    } else if (args is Map) {
      salonId = args['salonId']?.toString() ?? '';
    }
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    // Wait for location before firing the API call
    await LocationController.instance.ready;
    // Seed local cache with already-fetched location
    currentLocation.value = LocationController.instance.currentLocation.value;
    getSingleSalonById();
  }

  Future<void> confirmVisit() async {
    // ── 1. Fetch / re-request location on every press ──────────────────────
    isConfirmVisitLoading.value = true;

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

  // Future<void> confirmVisit() async {
  //   // ── 1. Re-fetch fresh location on every press ─────────────────────────
  //   final position = await LocationService.getCurrentPosition();
  //
  //   if (position == null) {
  //     showSnackBar(
  //       'Location access is required to confirm a visit. Please allow location permission and try again.',
  //       type: SnackBarType.warning,
  //     );
  //     return;
  //   }
  //
  //   // ── 2. Cache the fresh location ───────────────────────────────────────
  //   currentLocation.value = LatLong(
  //     lat: position.latitude,
  //     long: position.longitude,
  //   );
  //
  //   // ── 3. Confirm visit API call ─────────────────────────────────────────
  //   isConfirmVisitLoading.value = true;
  //   await DioService.instance.request(
  //     input: RequestInput(
  //       endpoint: '${ApiEndpoints.visitSalon}/$salonId',
  //       method: .POST,
  //       queryParams: {
  //         'lat1': currentLocation.value.lat,
  //         'lon1': currentLocation.value.long,
  //       },
  //     ),
  //     responseBuilder: (data) {},
  //     showMessage: true,
  //   );
  //   isConfirmVisitLoading.value = false;
  // }

  Future<void> openMap() async {
    final lat = salon.value.lat;
    final lon = salon.value.lon;

    // Google Maps directions URL — works on Android & iOS (via browser fallback)
    final uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=$lat,$lon&travelmode=driving',
    );

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!launched) {
      showSnackBar(
        'Could not open Maps. Please try again.',
        type: SnackBarType.error,
      );
    }
  }
}
