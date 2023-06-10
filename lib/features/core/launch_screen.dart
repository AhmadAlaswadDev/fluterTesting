import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/routes/key_routes.dart';

import '../../prefs/shared_pref_controller.dart';
import '../../utils/extensions/color_resource.dart';
import '../../utils/extensions/images_app.dart';


class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      String route = SharedPrefController().loggedIn ? KeyRoutes.dashboardScreen : KeyRoutes.loginScreen;
      Navigator.pushReplacementNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorResource.lightGray,
        ),
        child: Image.asset(
          ImagesApp.logoLaunch,
          height: 107.h,
          width: 168.w,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
