library otp_view;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/auth/otp/controllers/otp_controller.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';


import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../utils/extensions/color_resource.dart';
import '../../../../../../utils/extensions/images_app.dart';
import '../../../../../../widgets/app_elevated_button.dart';
import '../../../../../../widgets/text_app.dart';

part '../components/header_image.dart';

part '../components/pin_field.dart';

part '../components/send_button.dart';

part '../components/resend_button.dart';

part '../components/header_text.dart';

part '../components/mobile_text.dart';


class OTPScreen extends GetView<OTPController> {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 100.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _HeaderImage(),
            SizedBox(height: 30.h),
            const _HeaderText(),
            SizedBox(height: 34.h),
            const _MobileText(),
            SizedBox(height: 20.h),
            _PinField(),
            SizedBox(height: 64.h),
            Obx(() {
              return controller.loading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : _SendButton(
                title: context.localizations.send,
                onPressed: () async{
                  await controller.verifyPhoneNumber();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
