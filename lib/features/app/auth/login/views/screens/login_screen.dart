library login_view;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_recaptcha/flutter_firebase_recaptcha.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zaheed/features/app/auth/otp/controllers/otp_controller.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';

import '../../../../../../utils/extensions/color_resource.dart';
import '../../../../../../utils/extensions/images_app.dart';
import '../../../../../../utils/extensions/routes/key_routes.dart';
import '../../../../../../widgets/app_elevated_button.dart';
import '../../../../../../widgets/text_app.dart';
import '../../controllers/login_controller.dart';


part '../components/header_image.dart';
part '../components/header_text.dart';
part '../components/input_field.dart';
part '../components/terms_and_conditions.dart';
part '../components/login_button.dart';
part '../components/recaptcha_token.dart';


class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  LoginController loginController = Get.put(LoginController());
  OTPController otpController = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 100.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderImage(),
            SizedBox(height: 32.h),
            const HeaderText(),
            SizedBox(height: 22.h),
            InputField(),
            SizedBox(height: 70.h),
            Obx(() {
              return controller.loading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : LoginButton(
                title: context.localizations.signIn,
                onPressed: () async{
                  await controller.performLogin();
                },
              );
            }
            ),
            SizedBox(height: 22.h),
            Center(
              child: TermsAndConditions(
                title: context.localizations.already,
                onTitle: context.localizations.signUp,
                onPressed: () {
                  Navigator.pushNamed(context, KeyRoutes.registerScreen);
                },
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
                height: 500.h,
                child: const ReCAPTCHAToken()),
          ],
        ),
      ),
    );
  }
}
