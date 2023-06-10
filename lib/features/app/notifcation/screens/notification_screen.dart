library notification_view;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/extensions/icons_app.dart';

import '../../../../../../../../widgets/svg_picture.dart';
import '../../../../../../../../widgets/text_app.dart';
import '../../../../prefs/shared_pref_controller.dart';
import '../../../../utils/models/notification_model/notification_model.dart';

part '../components/title_text.dart';

part '../components/nearby_component.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({
    Key? key,
    this.message,
  }) : super(key: key);

  RemoteMessage? message;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isSwitched = true;

  List<RemoteMessage> myMessage = <RemoteMessage>[];

  List<NotificationModel> _todayMessages = [];
  List<NotificationModel> _yesterdayMessages = [];

  @override
  void initState() {
    // Set up Firebase Cloud Messaging listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        myMessage.add(message);
        debugPrint('message=> ${myMessage.first.notification!.body} ');

        final title = message.notification?.title ?? '';
        final body = message.notification?.body ?? '';
        final timeReceived = DateTime.now();

        SharedPrefController().addMessage(title, body, timeReceived);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: TextApp(
              text: context.localizations.notification,
              color: ColorResource.secondary),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  // Update the FCM token in your Firebase project based on the user's selection
                  if (isSwitched) {
                    FirebaseMessaging.instance.subscribeToTopic('all');
                  } else {
                    FirebaseMessaging.instance.deleteToken();
                  }
                });
              },
              hoverColor: ColorResource.white,
              activeColor: ColorResource.primary,
              activeTrackColor: ColorResource.secondary,
              inactiveThumbColor: ColorResource.black,
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FutureBuilder<List<NotificationModel>>(
            future: SharedPrefController().getMessages(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  final messages = snapshot.data!;
                  final now = DateTime.now();
                  final today = DateTime(now.year, now.month, now.day);
                  final yesterday = today.subtract(const Duration(days: 1));
                  for (final message in messages) {
                    final date = message.dateTime;
                    if (date!.isAfter(today)) {
                      _todayMessages.add(message);
                    } else if (date.isAfter(yesterday)) {
                      _yesterdayMessages.add(message);
                    }
                  }
                  final allMessages = [
                    ..._todayMessages,
                    ..._yesterdayMessages
                  ];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: allMessages.length,
                        reverse: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 30.h),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final message = allMessages[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_todayMessages.contains(message) &&
                                  index == 0)
                                TitleText(
                                  title: context.localizations.today,
                                ),
                              if (_yesterdayMessages.contains(message) &&
                                  index == _yesterdayMessages.length)
                                TitleText(
                                  title: context.localizations.yesterday,
                                ),
                              InkWell(
                                onTap: () {
                                  // Mark message as read when tapped
                                  SharedPrefController().markMessageAsRead(index);
                                },
                                child: NearByStoreComponent(
                                  title: message.title.toString(),
                                  detail: message.body.toString(),
                                ),
                              ),

                            ],
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(context.localizations.noNotifications),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
