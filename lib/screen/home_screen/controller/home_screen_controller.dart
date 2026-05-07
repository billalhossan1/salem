import 'dart:async';

import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/core/services/location_controller.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/screen/home_screen/repo/home_repo.dart';
import 'package:zena_app/service/socket_service.dart';
import 'package:zena_app/utils/shared_prefe.dart';

import '../../../service/steam_data_model.dart';
import '../../profile_screen/controller/profile_screen_controller.dart';

class HomeScreenController extends GetxController {
  final homeRepo = HomeRepo();

  RxList<RewardsItemModel> rewardList = <RewardsItemModel>[].obs;
  final profileController = Get.find<ProfileScreenController>();
  RxBool isRewardLoading = false.obs;
  String userId = '';
  RxInt count = 0.obs;
  late StreamSubscription<StreamDataModel> subscription;
  String fcmToken = '';

  String savedLang = 'en';
  // Refresh recent location + update server every 5 minutes
  Timer? _locationTimer;
  bool _isUpdatingLocation = false;

  @override
  void onInit() {
    super.onInit();

    _initial();
  }

  Future<void> _initial() async {
    // Wait until LocationController finishes its one-time fetch
    // before firing any API call.
    savedLang = await SharePrefsHelper.getString(
      SharedPreferenceValue.language,
    );
    fcmToken = await SharePrefsHelper.getString(SharedPreferenceValue.fcmToken);

    // Make sure initial location attempt is done (success or fail)
    await LocationController.instance.ready;

    // First update with whatever location we have right now
    await updateFcm();

    // Start periodic refresh (every 5 minutes)
    _startLocationRefreshTimer();

    notificationCount();
    getRewards();
    userId = await SharePrefsHelper.getString(SharedPreferenceValue.userId);
    SocketService.instance.connect(id: userId);
    subscription = SocketService.instance.streamController.stream.listen((event) {
      if (event.streamType == StreamType.notification) {
        count++;
      }
    });
  }

  void _startLocationRefreshTimer() {
    _locationTimer?.cancel();
    _locationTimer = Timer.periodic(const Duration(minutes: 5), (_) async {
      await _refreshLocationAndUpdateProfile();
    });
  }

  Future<void> _refreshLocationAndUpdateProfile() async {
    // Prevent overlapping calls if one takes longer than 5 minutes.
    if (_isUpdatingLocation) return;
    _isUpdatingLocation = true;
    try {
      // Re-fetch a fresh location (will update currentLocation inside controller)
      await LocationController.instance.refresh();

      // Push latest lat/lon (if available) to backend
      await updateFcm();
    } catch (e) {
      AppLogger.error('HomeScreenController: periodic location update failed — $e');
    } finally {
      _isUpdatingLocation = false;
    }
  }

  Future<void> updateFcm() async {
    final Map<String, dynamic> jsonBody = {
      'fcmToken': fcmToken,
    };

    final loc = LocationController.instance.currentLocation.value;
    if (loc.lat != 0 && loc.long != 0) {
      jsonBody['userLat'] = loc.lat;
      jsonBody['userLon'] = loc.long;
    }

    await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.updateProfile,
        method: .PATCH,
        jsonBody: jsonBody,
      ),
      responseBuilder: (data) {},
    );
    AppLogger.apiDebug("fcm token updated");
  }

  Future<void> getRewards() async {
    isRewardLoading.value = true;
    final result = await homeRepo.getAllRewards();
    isRewardLoading.value = false;

    if (result.isSuccess) {
      rewardList.addAll(result.data ?? []);
    }
  }

  Future<void> notificationCount() async {
    await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.notificationCount,
        method: .GET,
      ),
      responseBuilder: (data) {
        count.value = data;
      },
    );
  }

  @override
  void onClose() {
    _locationTimer?.cancel();
    try {
      subscription.cancel();
    } catch (_) {}
    super.onClose();
  }
}
