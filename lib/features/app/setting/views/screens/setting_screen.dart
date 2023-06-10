library setting_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/setting/views/screens/webview_screen.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/get/localizations/language_getx_controller.dart';

import '../../../../../../../../widgets/text_app.dart';
import '../../../../../widgets/restart_app.dart';
import '../components/language_dialog.dart';

part '../components/list_tile_component.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          centerTitle: true,
          title: TextApp(
              text: context.localizations.settingScreen,
              color: ColorResource.secondary),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTileComponent(
                    onPressed: () {
                      Get.dialog(const LanguageDialog());

                      // LanguageGetxController.to.changeLanguage();
                    },
                    title: context.localizations.language,
                    trailingIcon: Icons.arrow_forward_ios_rounded),
                // ListTileComponent(
                //     onPressed: () {},
                //     title: 'Contact Us',
                //     trailingIcon: Icons.arrow_forward_ios_rounded),
                ListTileComponent(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(
                              title: context.localizations.privacy),
                        ),
                      );
                    },
                    title: context.localizations.privacy,
                    trailingIcon: Icons.arrow_forward_ios_rounded),
                ListTileComponent(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WebViewScreen(title: context.localizations.terms),
                        ),
                      );
                    },
                    title: context.localizations.terms,
                    trailingIcon: Icons.arrow_forward_ios_rounded),
              ]),
        ),
      ),
    );
  }
}
