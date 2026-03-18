import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/screen/notificaton_screen/controller/notification_screen_controller.dart';
import 'package:zena_app/screen/notificaton_screen/model/notificationItemModel.dart';
import '../../utils/shared_prefe.dart';

// ─── Background handler (top-level, required by FCM) ────────────────────────
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('📩 Background message received: ${message.messageId}');
  log('Title: ${message.notification?.title}');
  log('Body:  ${message.notification?.body}');
  log('Data:  ${message.data}');
  // Cannot update the controller here – list refreshes when app comes to foreground.
}

// ─── Service ─────────────────────────────────────────────────────────────────
class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Single shared plugin instance so both setup and show use the same object
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // ── Android notification channel ──────────────────────────────────────────
  static const _androidChannelId = 'zena_high_importance_channel';
  static const _androidChannelName = 'Zena Notifications';

  /// Call this once before [setupFCM] (e.g. in main.dart) to register the
  /// Android notification channel and initialise the local plugin.
  static Future<void> initLocalNotifications() async {
    // Android initialisation – use the default launcher icon
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // iOS initialisation
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _localNotifications.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        log('🔔 Local notification tapped: ${response.payload}');
        Get.toNamed(AppRoute.notificationScreen);
      },
    );

    // Create the Android channel (no-op on iOS)
    if (Platform.isAndroid) {
      const channel = AndroidNotificationChannel(
        _androidChannelId,
        _androidChannelName,
        description: 'Used for important notifications from Zena.',
        importance: Importance.high,
        playSound: true,
        enableVibration: true,
      );

      await _localNotifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(channel);

      log('✅ Android notification channel created');
    }
  }

  // ── FCM setup ─────────────────────────────────────────────────────────────
  Future<void> setupFCM() async {
    try {
      // Request permission
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      log('🔔 Permission Status: ${settings.authorizationStatus}');

      // iOS: present alerts/badges/sounds while app is in foreground
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
            alert: true,
            badge: true,
            sound: true,
          );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        if (Platform.isIOS) {
          String? apnsToken;
          int retries = 0;
          const maxRetries = 5;

          while (apnsToken == null && retries < maxRetries) {
            await Future.delayed(Duration(seconds: 2 + retries));
            apnsToken = await _firebaseMessaging.getAPNSToken();
            log('🍎 APNs Token (attempt ${retries + 1}): $apnsToken');
            retries++;
          }

          if (apnsToken == null) {
            log('❌ Failed to get APNs token after $maxRetries attempts');
          }
        } else {
          await Future.delayed(const Duration(seconds: 1));
        }

        // Save FCM token
        final token = await _firebaseMessaging.getToken();
        log('🔥 FCM Device Token: $token');
        if (token != null && token.isNotEmpty) {
          await SharePrefsHelper.setString(
            SharedPreferenceValue.fcmToken,
            token,
          );
          log('✅ FCM Token saved');
        }
      } else {
        log('❌ Notification permission not granted');
      }

      // Token refresh
      _firebaseMessaging.onTokenRefresh.listen((token) {
        log('♻️ FCM Token Refreshed: $token');
        SharePrefsHelper.setString(SharedPreferenceValue.fcmToken, token);
      });

      // Foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // Background messages
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      // Terminated state – app opened via notification
      final initialMessage = await FirebaseMessaging.instance
          .getInitialMessage();
      if (initialMessage != null) {
        _handleNotificationNavigation(initialMessage);
      }

      // Background state – app resumed via notification tap
      FirebaseMessaging.onMessageOpenedApp.listen(
        _handleNotificationNavigation,
      );
    } catch (e) {
      log('❌ FCM setup error: $e');
    }
  }

  // ── Foreground handler ────────────────────────────────────────────────────
  void _handleForegroundMessage(RemoteMessage message) {
    log('📩 Foreground message: ${message.notification?.title}');
    log('Body: ${message.notification?.body}');
    log('Data: ${message.data}');

    final title =
        message.notification?.title ??
        message.data['title'] as String? ??
        'Notification';
    final body =
        message.notification?.body ??
        message.data['body'] as String? ??
        message.data['message'] as String? ??
        'New message';

    // 1️⃣  System push notification (shows in the notification bar)
    _showLocalNotification(message);

    // 2️⃣  In-app snackbar for immediate feedback
    // Get.snackbar(
    //   title,
    //   body,
    //   backgroundColor: Colors.black,
    //   colorText: Colors.white,
    //   duration: const Duration(seconds: 3),
    //   onTap: (_) => Get.toNamed(AppRoute.notificationScreen),
    // );

    // 3️⃣  Update the notification list controller if it's alive
    try {
      if (Get.isRegistered<NotificationScreenController>()) {
        final controller = Get.find<NotificationScreenController>();
        final newNotification = NotificationItemModel(
          sId:
              message.messageId ??
              DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          body: body,
          read: false,
        );
        controller.notificationList.insert(0, newNotification);
        controller.notificationList.refresh();
        log('✅ Notification list updated');
      }
    } catch (e, st) {
      log('❌ Error updating notification controller: $e\n$st');
    }
  }

  // ── Show local (system) notification ─────────────────────────────────────
  Future<void> _showLocalNotification(RemoteMessage message) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        _androidChannelId,
        _androidChannelName,
        channelDescription: 'Used for important notifications from Zena.',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const platformDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      final title =
          message.notification?.title ??
          message.data['title'] as String? ??
          'Notification';
      final body =
          message.notification?.body ??
          message.data['body'] as String? ??
          message.data['message'] as String? ??
          '';

      await _localNotifications.show(
        message.hashCode, // unique ID per message
        title.tr,
        body.tr,
        platformDetails,
        payload: message.data.isNotEmpty ? message.data.toString() : null,
      );

      log('✅ System notification shown');
    } catch (e, st) {
      log('❌ Error showing local notification: $e\n$st');
    }
  }

  // ── Navigation on tap ─────────────────────────────────────────────────────
  void _handleNotificationNavigation(RemoteMessage message) {
    log('🔀 Navigating to notification screen: ${message.notification?.title}');
    Get.toNamed(AppRoute.notificationScreen);
  }
}
