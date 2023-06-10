import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/prefs/shared_pref_controller.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/extensions/routes/key_routes.dart';
import 'package:zaheed/utils/get/localizations/language_getx_controller.dart';
import 'package:zaheed/widgets/restart_app.dart';

import 'firebase_options.dart';
import 'helpers/fb_notifications.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPref();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await firebaseMessagingBackgroundHandler(const RemoteMessage());
  await FbNotifications.initNotifications();
  await FbNotifications.getToken();
  runApp(
    //this is class for Restart App when change lang
    RestartWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LanguageGetxController _languageGetxController =Get.put<LanguageGetxController>(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: context.appTheme,
        localizationsDelegates: context.localizationsDelegate,
        supportedLocales: context.supportedLocales,
        locale: Locale(_languageGetxController.language.value),
        initialRoute: KeyRoutes.launchScreen,
        routes: context.routes,
      ),
    );
  }
}

