import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';

class DeepLinkService extends GetxService {
  static DeepLinkService get instance => Get.find<DeepLinkService>();

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  /// Stores the first path segment from the deep link.
  /// e.g. 'referral' from https://zenaapp.com/referral/ABC123
  final RxString pendingPath = ''.obs;

  /// Stores the referral code when the link is https://zenaapp.com/referral/{code}
  final RxString pendingReferralCode = ''.obs;

  /// Stores the full URI for richer handling if needed.
  Uri? pendingUri;

  /// Call this before runApp to eagerly capture a cold-start deep link.
  static Future<DeepLinkService> init() async {
    final service = DeepLinkService();
    try {
      final appLinks = AppLinks();
      final uri = await appLinks.getInitialLink();
      if (uri != null) {
        service._handleDeepLink(uri);
        AppLogger.debug(
          'DeepLinkService: cold-start link captured before runApp: $uri',
          tag: 'DeepLink',
        );
      }
    } catch (e) {
      AppLogger.error(
        'DeepLinkService: failed to get initial link in init(): $e',
        tag: 'DeepLink',
      );
    }
    Get.put(service);
    return service;
  }

  @override
  void onInit() {
    super.onInit();
    _appLinks = AppLinks();
    _startListening();
  }

  void _startListening() {
    // Handle links while app is running (foreground / background).
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      _handleDeepLink(uri);
    });
  }

  void _handleDeepLink(Uri uri) {
    AppLogger.debug('Deep link received: $uri', tag: 'DeepLink');
    pendingUri = uri;
    final segments = uri.pathSegments.where((s) => s.isNotEmpty).toList();
    pendingPath.value = segments.isNotEmpty ? segments.first : '';

    // Extract referral code: https://zenaapp.com/referral/{code}
    if (segments.length >= 2 && segments[0] == 'referral') {
      pendingReferralCode.value = segments[1];
      AppLogger.debug(
        'Referral code extracted: "${pendingReferralCode.value}"',
        tag: 'DeepLink',
      );
    }

    AppLogger.debug('Pending path: "${pendingPath.value}"', tag: 'DeepLink');
  }

  /// Call this after you have consumed the pending link.
  void clearPending() {
    pendingPath.value = '';
    pendingReferralCode.value = '';
    pendingUri = null;
  }

  @override
  void onClose() {
    _linkSubscription?.cancel();
    super.onClose();
  }
}
