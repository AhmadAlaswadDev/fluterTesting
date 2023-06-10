import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions/color_resource.dart';
import '../utils/extensions/images_app.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  final Widget? leading;
  final List<Widget> actions;
  final bool isHomeScreen;

  const CustomAppBar({
    Key? key,
    // required this.title,
    this.leading,
    this.actions = const [],
    this.isHomeScreen = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    Widget? leadingWidget;
    if (isHomeScreen) {
      leadingWidget = null;
    } else {
      leadingWidget = IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: ColorResource.black,
        ),
      );
    }

    return AppBar(
      titleSpacing: -15.w,
      leadingWidth: 60.w,
      title: InkWell(
        onTap: (){
          Navigator.pushReplacementNamed(context, '/home_screen');
        },
        child: Image.asset(
          ImagesApp.logoApp,
          height: 120.h,
          width: 120.w,
        ),
      ),
      leading: leadingWidget,
      actions: actions,
    );
  }
}
