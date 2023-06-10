import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/routes/key_routes.dart';

import '../../features/app/dashboard/views/bn_screens/home/views/screens/home_screen.dart';
import '../../features/app/dashboard/views/dashboard_screen.dart';
import '../../features/app/auth/login/views/screens/login_screen.dart';
import '../../features/app/auth/otp/views/screens/otp_screen.dart';
import '../../features/app/auth/registration/views/screens/registration_screen.dart';
import '../../features/core/launch_screen.dart';

///General Extension App
extension ContextExtension on BuildContext {

  ///SnackBar For App
  void showSnackBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? ColorResource.red : ColorResource.green,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  ///Localizations App
  List<LocalizationsDelegate<dynamic>> get localizationsDelegate =>
      AppLocalizations.localizationsDelegates;

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  AppLocalizations get localizations => AppLocalizations.of(this)!;

  ///ThemeDate App
  ThemeData get appTheme => ThemeData(
    scaffoldBackgroundColor: ColorResource.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorResource.primary,
      secondary: ColorResource.secondary,
    ),
    // primarySwatch: Colors.blue,
    fontFamily: 'SFUIDisplay',
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.grey[800]),
      bodyText1: TextStyle(
          fontSize: 15.sp,
          color: ColorResource.gray,
          fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorResource.transparent,
      elevation: 0,
      centerTitle: false,
        iconTheme: IconThemeData(color: ColorResource.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.only(top: 12.h, right: 20.w),
      hintStyle: TextStyle(
        fontSize: 15.sp,
        color: const Color(0xFFAAAAAA),
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.r),
        ),
      ),
    ),
  );


  ///Headers API App
  Map<String,String> get headers {
    var headers ={
      'Accept':'application/json',
      // 'language':SharedPrefController().language,
    };
    // if(SharedPrefController().loggedIn) {
    //   headers['Authorization'] = SharedPrefController().token;
    //   // headers['Authorization'] = 'Bearer TOKEN';
    // }
    // else if(SharedPrefController().register) {
    //   headers['Authorization'] = SharedPrefController().token;
    //   // headers['Authorization'] = 'Bearer TOKEN';
    // }
    return headers;
  }


  ///Routes App
  Map<String, WidgetBuilder> get routes => {
    //---------------------------CORE SCREEN-----------------------------
    KeyRoutes.launchScreen: (context) => const LaunchScreen(),
    //---------------------------REGISTRATION SCREEN---------------------
    KeyRoutes.registerScreen: (context) => RegistrationScreen(),
    KeyRoutes.otpScreen: (context) => const OTPScreen(),
    KeyRoutes.loginScreen: (context) => LoginScreen(),
    //---------------------------APP SCREEN------------------------------
    KeyRoutes.dashboardScreen: (context) => const DashboardScreen(),
    KeyRoutes.homeScreen: (context) =>  HomeScreen(),

  };


}
