import 'dart:async';

import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/models/lat_long.dart';
import 'package:zena_app/core/services/location_service.dart';

/// Global singleton that fetches the device location **once** at app startup.
///
/// Any controller that needs the location before making an API call should do:
/// ```dart
/// await LocationController.instance.ready;
/// final loc = LocationController.instance.currentLocation.value;
/// ```
///
/// If the fetch fails (permission denied / service off) [isAvailable] will be
/// false and [currentLocation] stays at (0, 0).
class LocationController extends GetxService {
  static LocationController get instance => Get.find<LocationController>();

  /// Completes once the initial location fetch has finished (success or fail).
  final Completer<void> _readyCompleter = Completer<void>();

  /// Await this before making any location-dependent API call.
  Future<void> get ready => _readyCompleter.future;

  /// The cached location. Starts at (0, 0) until the fetch succeeds.
  Rx<LatLong> currentLocation = LatLong(lat: 0, long: 0).obs;

  /// True if we successfully obtained a real GPS position.
  RxBool isAvailable = false.obs;

  /// True while the initial fetch is in progress.
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    isLoading.value = true;
    try {
      final position = await LocationService.getCurrentPosition();
      if (position != null) {
        currentLocation.value = LatLong(
          lat: position.latitude,
          long: position.longitude,
        );
        isAvailable.value = true;
        AppLogger.debug(
          'LocationController: location ready '
          '(${position.latitude}, ${position.longitude})',
          tag: 'LocationController',
        );
      } else {
        AppLogger.warning(
          'LocationController: location not available.',
          tag: 'LocationController',
        );
      }
    } catch (e) {
      AppLogger.error(
        'LocationController: fetch failed — $e',
        tag: 'LocationController',
      );
    } finally {
      isLoading.value = false;
      if (!_readyCompleter.isCompleted) _readyCompleter.complete();
    }
  }

  /// Call this to refresh the location (e.g. user taps retry).
  Future<void> refresh() => _fetchLocation();
}

