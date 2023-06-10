import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/extensions/color_resource.dart';

//typedef BackgroundMessageHandler = Future<void> Function(RemoteMessage message);
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  //BACKGROUND Notifications - iOS & Android
  await Firebase.initializeApp();
  debugPrint('Message: ${remoteMessage.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin localNotificationsPlugin;

mixin FbNotifications {
  // String serverToken = "";
  // String token = "";

  /// CALLED IN main function between ensureInitialized <-> runApp(widget);
  static Future<void> initNotifications() async {
    //Connect the previous created function with onBackgroundMessage to enable
    //receiving notification when app in Background.
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    //Channel
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'zaheed_notification_channel',
        'Zaheed App Notifications Channel',
        description:
            'This channel will receive notifications specific to Zaheed App',
        importance: Importance.high,
        enableLights: true,
        enableVibration: true,
        ledColor: ColorResource.primary,
        showBadge: true,
        playSound: true,
      );
    }

    //Flutter Local Notifications Plugin (FOREGROUND) - ANDROID CHANNEL
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    //iOS Notification Setup (FOREGROUND)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  //iOS Notification Permission
  Future<void> requestNotificationPermissions() async {
    debugPrint('requestNotificationPermissions');
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      carPlay: false,
      announcement: false,
      provisional: false,
      criticalAlert: false,
    );
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      FirebaseMessaging.instance.requestPermission();
      debugPrint('GRANT PERMISSION');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.denied) {
      FirebaseMessaging.instance.requestPermission();
      debugPrint('Permission Denied');
    }
  }

  //ANDROID
  void initializeForegroundNotificationForAndroid() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Message Received: ${message.data}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = notification?.android;
      if (notification != null && androidNotification != null) {
        localNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'ic_stat_ic_notification',
              // icon: 'launch_background',
            ),
          ),
        );
      }
      debugPrint('${message.data}');

      Get.snackbar(
        "${message.data['title']}",
        "${message.data['body']}",
        duration: const Duration(seconds: 100),
      );
    });
  }

  //GENERAL (Android & iOS)
  void manageNotificationAction() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _controlNotificationNavigation(message.data);

    });
  }

  void _controlNotificationNavigation(Map<String, dynamic> data) {

    debugPrint('Data: $data');
    if (data['type'] != null) {
      switch (data['type']) {
        case 'request':
          var productId = data['type'];
          debugPrint('Message Type: $productId');
          break;

        case 'settings':
          debugPrint('Navigate to settings');
          break;

        case 'profile':
          debugPrint('Navigate to Profile');
          break;
      }
    }
  }

  // Future<void> sendNotification(String title, String body, String type) async {
  //   await FirebaseMessaging.instance.sendMessage(
  //     data: {
  //       "type": type,
  //       "body": body.toString(),
  //       "title": title.toString(),
  //     },
  //     collapseKey: serverToken,
  //     to: "",
  //   );
  // }

  // sendNotify(String title, String body, String topic) async {
  //   await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       body: jsonEncode(<String, dynamic>{
  //         "notification": <String, dynamic>{
  //           "body": body.toString(),
  //           "title": title.toString(),
  //         },
  //         "priority": "high",
  //         "data": <String, dynamic>{
  //           "click_action": "FLUTTER_NOTIFICATION_CLICK",
  //         },
  //         "to": "/topics/${topic}",
  //       }),
  //       headers: <String, String>{
  //         "Content-Type": "application/json",
  //         "Authorization": "key=$serverToken",
  //       });
  // }

  static Future<void> getToken() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      debugPrint("Token device📲=>  $value ");
    });
  }
}
