library change_password_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';

import '../../../../../utils/extensions/color_resource.dart';
import '../../../../../utils/extensions/images_app.dart';
import '../../../../../widgets/app_elevated_button.dart';
import '../../../../../widgets/custom_Input_field_icon.dart';
import '../../../../../widgets/text_app.dart';


part '../components/header_image.dart';
part '../components/header_text.dart';
part '../components/input_field.dart';
part '../components/change_password_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        centerTitle: true,
        title: TextApp(text: 'Change Password', color: ColorResource.secondary),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderImage(),
            SizedBox(height: 32.h),
            const HeaderText(),
            SizedBox(height: 22.h),
            const InputField(),
            SizedBox(height: 70.h),
            ChangePasswordButton(
              title: 'Save Change',
              onPressed: () async{
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
