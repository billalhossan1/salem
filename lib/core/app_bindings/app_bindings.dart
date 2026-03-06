import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/redem_now/controller/redeem_now_controller.dart';
import 'package:zena_app/screen/view_history/controller/view_history_controller.dart';

import '../../screen/auth_screen/login_screen/controller/login_screen_controller.dart';
import '../../screen/auth_screen/otp_screen/controller/otp_screen_controller.dart';
import '../../screen/bottom_nav/controller/bottom_nav_controller.dart';
import '../../screen/edit_profile/controller/edit_profile_controller.dart';
import '../../screen/home_screen/controller/home_screen_controller.dart';
import '../../screen/invite_friends/controller/invite_friends_controller.dart';
import '../../screen/invite_history/controller/invite_history_controller.dart';
import '../../screen/myvisit_screen/controller/myvisit_screen_controller.dart';
import '../../screen/notificaton_screen/controller/notification_screen_controller.dart';
import '../../screen/onboarding_screen/controller/onboarding_screen_controller.dart';
import '../../screen/profile_screen/controller/profile_screen_controller.dart';
import '../../screen/rewards_screen/controller/rewards_screen_controller.dart';
import '../../screen/rewards_details/controller/reward_details_controller.dart';
import '../../screen/salon_details/controller/salon_details_controller.dart';
import '../../screen/salon_screen/controller/salon_screen_controller.dart';
import '../../screen/splash_screen/controller/splash_screen_controller.dart';

class AppInitialBindings extends Bindings {
  @override
  void dependencies() {
    //! Splash Screen controller
    Get.lazyPut<SplashScreenController>(() {
      AppLogger.screen("Splash Screen");
      return SplashScreenController();
    }, fenix: true);

    Get.lazyPut<HomeScreenController>(() {
      AppLogger.screen("Splash Screen");
      return HomeScreenController();
    }, fenix: true);

    //! Onboarding Screen controller
    Get.lazyPut<OnboardingScreenController>(() {
      AppLogger.screen("Onboarding Screen");
      return OnboardingScreenController();
    }, fenix: true);

    //! Login Screen controller
    Get.lazyPut<LoginScreenController>(() {
      AppLogger.screen("Login Screen");
      return LoginScreenController();
    }, fenix: true);

    //! Otp Screen controller
    Get.lazyPut<OtpScreenController>(() {
      AppLogger.screen("Otp Screen");
      return OtpScreenController();
    }, fenix: true);

    Get.lazyPut<BottomNavController>(() {
      return BottomNavController();
    }, fenix: true);





    //! Notification Screen Controller
    Get.lazyPut<NotificationScreenController>(() {
      AppLogger.screen("Notification Screen Controller");
      return NotificationScreenController();
    }, fenix: true);

    //! Salon Screen Controller

    Get.lazyPut<SalonScreenController>(() {
      AppLogger.screen("Notification Screen Controller");
      return SalonScreenController();
    }, fenix: true);


    Get.lazyPut<MyvisitScreenController>(() {
      AppLogger.screen("Notification Screen Controller");
      return MyvisitScreenController();
    }, fenix: true);



    Get.lazyPut<ProfileScreenController>(() {
      AppLogger.screen("Notification Screen Controller");
      return ProfileScreenController();
    }, fenix: true);


    //! Myvisit Screen Controller


    AppLogger.screen("Profile Screen Controller");

    //! Edit Profile Controller
    Get.lazyPut<EditProfileController>(() {
      AppLogger.screen("Edit Profile Controller");
      return EditProfileController();
    }, fenix: true);

    //! Invite Friends Controller
    Get.lazyPut<InviteFriendsController>(() {
      AppLogger.screen("Invite Friends Controller");
      return InviteFriendsController();
    }, fenix: true);



    Get.lazyPut<RewardsScreenController>(() {
      AppLogger.screen("Invite Friends Controller");
      return RewardsScreenController();
    }, fenix: true);

    //! RewardsScreenController

    AppLogger.screen("Rewards Screen Controller");

    //! SalonDetailsController
    Get.lazyPut<RewardDetailsController>(() {
      AppLogger.screen("Reward Details Controller");
      return RewardDetailsController();
    }, fenix: true);

    Get.lazyPut<ViewHistoryController>(() {
      return ViewHistoryController();
    }, fenix: true);

    Get.lazyPut<RedeemNowController>(() {
      return RedeemNowController();
    }, fenix: true);

    //! SalonDetailsController
    Get.lazyPut<SalonDetailsController>(() {
      AppLogger.screen("Salon Details Controller");
      return SalonDetailsController();
    }, fenix: true);

    //! InviteHistoryController
    Get.lazyPut<InviteHistoryController>(() {
      AppLogger.screen("Invite History Controller");
      return InviteHistoryController();
    }, fenix: true);
  }
}
