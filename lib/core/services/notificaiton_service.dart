import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';
import 'package:zena_app/screen/notificaton_screen/controller/notification_screen_controller.dart';
import 'package:zena_app/screen/notificaton_screen/model/notificationItemModel.dart';
import '../../utils/shared_prefe.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> setupFCM() async {
    try {
      // 🔔 iOS Permission
      NotificationSettings settings =
      await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      log("🔔 Permission Status: ${settings.authorizationStatus}");

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        // 🍎 iOS specific handling
        if (Platform.isIOS) {
          // Wait for APNs token to be available
          String? apnsToken;
          int retries = 0;
          const maxRetries = 5;

          while (apnsToken == null && retries < maxRetries) {
            await Future.delayed(Duration(seconds: 2 + retries));
            apnsToken = await _firebaseMessaging.getAPNSToken();
            log("🍎 APNs Token (attempt ${retries + 1}): $apnsToken");
            retries++;
          }

          if (apnsToken == null) {
            log("❌ Failed to get APNs token after $maxRetries attempts");
            log("⚠️ Make sure:");
            log("   1. Push Notifications capability is enabled in Xcode");
            log("   2. APNs certificates are configured in Firebase Console");
            log("   3. Running on a real device (APNs doesn't work on simulator)");
          }
        } else {
          // Android needs shorter delay
          await Future.delayed(const Duration(seconds: 1));
        }

        // 🔥 FCM Token
        String? token = await _firebaseMessaging.getToken();
        log("🔥 FCM Device Token: $token");

        if (token != null && token.isNotEmpty) {
          await SharePrefsHelper.setString(
            SharedPreferenceValue.fcmToken,
            token,
          );
          log("✅ FCM Token saved successfully");
        } else {
          log("❌ FCM Token is null or empty");
        }
      } else {
        log("❌ Notification permission not granted");
      }

      // 🔄 Token refresh listener
      _firebaseMessaging.onTokenRefresh.listen((String token) {
        log("♻️ FCM Token Refreshed: $token");
        SharePrefsHelper.setString(
          SharedPreferenceValue.fcmToken,
          token,
        );
      });

      // 📩 Foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // 📩 Background
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      // 📩 Terminated
      RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        _handleNotificationNavigation(initialMessage);
      }

      // 📩 App opened from background
      FirebaseMessaging.onMessageOpenedApp.listen(
        _handleNotificationNavigation,
      );
    } catch (e) {
      log("❌ FCM setup error: $e");
    }
  }
  @pragma("vm:entry-point")
  void _handleForegroundMessage(RemoteMessage message) {
    log("📩 Foreground message received: ${message.messageId}");
    log("Title: ${message.notification?.title}");
    log("Body: ${message.notification?.body}");
    log("Data: ${message.data}");

    try {
      // Update NotificationController if it exists
      if (Get.isRegistered<NotificationScreenController>()) {
        final notificationController = Get.find<NotificationScreenController>();

        // Create a NotificationItem from the FCM message
        final newNotification = NotificationItemModel(
          sId: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
          title: message.notification?.title ?? message.data['title'] ?? 'Notification',
          body: message.notification?.body ?? message.data['body'] ?? message.data['message'] ?? 'New message',
          // body: message.notification?.body ?? message.data['message'],
          read: false,
          // createdAt: DateTime.now().toIso8601String(),
          // sender: message.data['sender'],
          // receiver: message.data['receiver'] != null ? [message.data['receiver']] : null,
        );

        log("Adding notification to controller list");
        // Add to the notification list
        notificationController.notificationList.insert(0, newNotification);
        notificationController.notificationList.refresh();

        // Increment unread count
        // notificationController.unreadCount.value++;
        // notificationController.unreadCount.refresh();

        // log("✅ Notification added to list. Total: ${notificationController.notificationList.length}");
        // log("✅ Unread count updated to: ${notificationController.unreadCount.value}");
      } else {
        log("⚠️ NotificationController not registered yet");
      }
    } catch (e, stackTrace) {
      log("❌ Error updating notification controller: $e");
      log("Stack trace: $stackTrace");
    }

    // Show snackbar notification
    Get.snackbar(
      message.notification?.title ?? message.data['title'] ?? 'Notification',
      message.notification?.body ?? message.data['body'] ?? message.data['message'] ?? 'New message',
      backgroundColor: Colors.black,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      onTap: (_) {
        Get.toNamed(
          AppRoute.notificationScreen,
          // arguments: message.data,
        );
      },
    );
  }
  @pragma("vm:entry-point")
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    log("📩 Background message received: ${message.messageId}");
    log("Title: ${message.notification?.title}");
    log("Body: ${message.notification?.body}");
    log("Data: ${message.data}");
    // Note: We can't update the controller here as the app might not be running
    // The notification list will be refreshed when the app comes to foreground
  }

  void _handleNotificationNavigation(RemoteMessage message) {
    Get.toNamed(
      AppRoute.notificationScreen,
      // arguments: message.data,
    );
  }
}
