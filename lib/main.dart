import 'package:core_kit/core_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';
import 'package:zena_app/widget/app_observer/app_observer.dart';

import 'core/app_route/app_route.dart';
import 'utils/app_colors/app_colors.dart';

void main() {
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
      navigatorObservers: [NavigationObserver()],
      scaffoldMessengerKey: scaffoldMessengerKey,
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: AppRoute.splashscreen,
      navigatorKey: Get.key,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,

          hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.normal),
        ),
        fontFamily: 'Poppins',
        // colorScheme: ColorScheme(
        //   brightness: Brightness.light,
        //  primary: primary, onPrimary: onPrimary,
        //   secondary: secondary, onSecondary: onSecondary,
        //    error: error, onError: onError,
        //    surface: surface,
        //    onSurface: onSurface),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
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
                  data
                ) async {}, // clearTokens: () => StorageService().removeTokens()
          ),
          child: child,
        );
      },
    );
  }
}
