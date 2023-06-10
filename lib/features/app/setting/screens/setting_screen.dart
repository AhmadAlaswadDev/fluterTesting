library setting_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';

import '../../../../../../../../widgets/text_app.dart';

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
          title: TextApp(text: 'Setting Screen', color: ColorResource.secondary),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTileComponent(
                    onPressed: () {},
                    title: 'Language',
                    trailingIcon: Icons.arrow_forward_ios_rounded),
                ListTileComponent(
                    onPressed: () {},
                    title: 'Contact Us',
                    trailingIcon: Icons.arrow_forward_ios_rounded),
                ListTileComponent(
                    onPressed: () {},
                    title: 'Helps',
                    trailingIcon: Icons.arrow_forward_ios_rounded),
                ListTileComponent(
                    onPressed: () {},
                    title: 'Terms',
                    trailingIcon: Icons.arrow_forward_ios_rounded),
              ]),
        ),
      ),
    );
  }
}
