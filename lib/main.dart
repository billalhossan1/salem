import 'package:core_kit/core_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/core/app_bindings/app_bindings.dart';
import 'package:zena_app/widget/app_device_utils/app_deviceutils.dart';
import 'package:zena_app/widget/app_observer/app_observer.dart';

import 'core/app_route/app_route.dart';
import 'utils/app_colors/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //! Device Utils
  DeviceUtils.lockDevicePortrait();
  runApp(const MyApp());
}

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppInitialBindings(),
      navigatorObservers: [NavigationObserver()],
      scaffoldMessengerKey: scaffoldMessengerKey,
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: AppRoute.splashscreen,
      navigatorKey: Get.key,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColor.screenBackgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryColor,
          primary: AppColor.primaryColor, // button
          onPrimary: AppColor.darkColor, // text on button
          secondary: AppColor.textColor, // unselected radio
          onSurface: AppColor.textColor, //text on card
          surface: AppColor.secondaryColor, //card color
          outline: AppColor.textColor, // border color
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(40),
          //   borderSide: BorderSide(color: AppColor.outlineColor, width: 1.5),
          // ),
          hintStyle: TextStyle(
            color: AppColor.textColor,
            fontStyle: FontStyle.normal,
          ), //hint and prefix color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 50),
            backgroundColor: AppColor.primaryColor, //button background
            foregroundColor: Colors.orangeAccent, //loader color
            textStyle: const TextStyle(color: AppColor.darkColor), //title color
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.5, color: Colors.transparent),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
      getPages: AppRoute.appRoutes,
      builder: (context, child) {
        return CoreKit.init(
          back: () {
            Get.back();
          },
          designSize: const Size(428, 926),
          imageBaseUrl: ApiEndpoints.imageUrl,
          backButton: Icon(Icons.arrow_back_ios, color: Colors.red),
          navigatorKey: Get.key,
          dioServiceConfig: DioServiceConfig(
            baseUrl: ApiEndpoints.baseUrl,
            refreshTokenEndpoint: ApiEndpoints.refreshToken,
            onLogout: () {
              // StorageService().removeTokens();
              Get.offAllNamed(AppRoute.splashscreen);
            },
            enableDebugLogs: kDebugMode,
          ),
          tokenProvider: TokenProvider(
            accessToken: () async => '',
            refreshToken: () async => '',
            updateTokens:
                (
                  data,
                ) async {}, // clearTokens: () => StorageService().removeTokens()
          ),
          child: child,
        );
      },
    );
  }
}
