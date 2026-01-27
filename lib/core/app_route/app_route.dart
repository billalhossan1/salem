import 'package:get/get.dart';
import 'package:zena_app/screen/auth_screen/otp_screen/controller/otp_screen_controller.dart';
import 'package:zena_app/screen/auth_screen/otp_screen/otp_screen.dart';
import 'package:zena_app/screen/onboarding_screen/onboarding_screen.dart';

import 'package:zena_app/screen/redem_now/redem_now_screen.dart';

import '../../screen/auth_screen/login_screen/login_screen.dart';
import '../../screen/bottom_nav/bottom_nav.dart';
import '../../screen/edit_profile/edit_profile_screen.dart';
import '../../screen/invite_friends/invite_friends_screen.dart';
import '../../screen/notificaton_screen/controller/notification_screen_controller.dart';
import '../../screen/notificaton_screen/notification_screen.dart';
import '../../screen/rewards_details/reward_details_screen.dart';
import '../../screen/salon_details/salon_details_screen.dart';
import '../../screen/splash_screen/splash_screen.dart';
import '../../screen/view_history/view_history_screen.dart';

class AppRoute {
  AppRoute._();

  static const String splashscreen = '/splashscreen';
  static const String onboardingScreen = "/onboardingScreen";
  static const String loginScreen = "/loginScreen";
  static const String otpScreen = "/otpScreen";
  static const String bottomNav = "/bottomNav";
  static const String notificationScreen = "/notificationScreen";
  static const String editProfileScreen = "/editProfileScreen";
  static const String inviteFriendsScreen = "/inviteFriendsScreen";
  static const String salonDetailsScreen = "/salonDetailsScreen";
  static const String rewardDetailsScreen = "/rewardDetailsScreen";
  static const String redemNowScreen = "/redemNowScreen";
  static const String viewHistoryScreen = "/viewHistoryScreen";

  static final List<GetPage> appRoutes = [
    GetPage(
      name: splashscreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Onboarding Screen
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Login Screen
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Otp Screen
    GetPage(
      name: otpScreen,
      page: () => OptScreen(),
      binding: BindingsBuilder(() {
        Get.put(OtpScreenController());
      }),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Bottom Nav
    GetPage(
      name: bottomNav,
      page: () => BottomNav(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Notification Screen
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      binding: BindingsBuilder(() {
        Get.put(NotificationScreenController());
      }),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Edit Profile Screen
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),

      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Invite Friends Screen
    GetPage(
      name: inviteFriendsScreen,
      page: () => InviteFriendsScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Salon Details Screen
    GetPage(
      name: salonDetailsScreen,
      page: () => SalonDetailsScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Reward Details Screen
    GetPage(
      name: rewardDetailsScreen,
      page: () => RewardsDetailsScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! Redem Now Screen
    GetPage(
      name: redemNowScreen,
      page: () => RedemNowScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),

    //! View History Screen
    GetPage(
      name: viewHistoryScreen,
      page: () => ViewHistoryScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
