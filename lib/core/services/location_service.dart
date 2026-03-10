import 'dart:io';

import 'package:core_kit/core_kit.dart';
import 'package:geolocator/geolocator.dart';

/// Reusable service that handles location permissions and returns the
/// current [Position].
///
/// Usage:
/// ```dart
/// final position = await LocationService.getCurrentPosition();
/// if (position != null) {
///   currentLocation.value = LatLong(lat: position.latitude, long: position.longitude);
/// }
/// ```
class LocationService {
  LocationService._();

  /// Request permission and return the current device position.
  /// Returns `null` if permission is denied or location is disabled.
  static Future<Position?> getCurrentPosition() async {
    // 1. Check if location services are enabled
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppLogger.warning(
        'Location services are disabled.',
        tag: 'LocationService',
      );
      return null;
    }

    // 2. Check / request permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppLogger.warning(
          'Location permission denied.',
          tag: 'LocationService',
        );
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      AppLogger.warning(
        'Location permission permanently denied — open app settings.',
        tag: 'LocationService',
      );
      // Open system settings on both Android & iOS
      await Geolocator.openAppSettings();
      return null;
    }

    // Explicitly require a granted state — catches unableToDetermine
    // and any other edge-case returned by some Android builds.
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      AppLogger.warning(
        'Location permission not granted (state: $permission).',
        tag: 'LocationService',
      );
      return null;
    }

    // 3. Fetch position
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: _locationSettings(),
      );
      AppLogger.debug(
        'Location: ${position.latitude}, ${position.longitude}',
        tag: 'LocationService',
      );
      return position;
    } catch (e) {
      AppLogger.error('Failed to get position: $e', tag: 'LocationService');
      return null;
    }
  }

  /// Platform-appropriate [LocationSettings] for balanced accuracy & battery.
  static LocationSettings _locationSettings() {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
        forceLocationManager: false,
        intervalDuration: const Duration(seconds: 10),
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.other,
        distanceFilter: 0,
        pauseLocationUpdatesAutomatically: false,
        // Only "when in use" — no background permission needed
        showBackgroundLocationIndicator: false,
      );
    }
    // Fallback for other platforms
    return const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    );
  }
}
