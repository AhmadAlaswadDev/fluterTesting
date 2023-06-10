library register;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/extensions/routes/key_routes.dart';

import '../../../../../../utils/extensions/color_resource.dart';
import '../../../../../../utils/extensions/images_app.dart';
import '../../../../../../widgets/app_elevated_button.dart';
import '../../../../../../widgets/custom_Input_field_icon.dart';
import '../../../../../../widgets/text_app.dart';
import '../../../../setting/views/screens/webview_screen.dart';
import '../../controllers/registration_controller.dart';


part '../components/header_image.dart';
part '../components/header_text.dart';
part '../components/input_field.dart';
part '../components/terms_and_conditions.dart';
part '../components/register_button.dart';



class RegistrationScreen extends GetView<RegistrationController> {
  RegistrationScreen({super.key});

  RegistrationController  registrationController  = Get.put(RegistrationController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 100.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderImage(),
            SizedBox(height: 32.h),
            const HeaderText(),
            SizedBox(height: 22.h),
            InputField(),
            SizedBox(height: 37.h),
            TermsAndConditions(
              title: context.localizations.byContinuing,
              onTitle: context.localizations.terms,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(title: context.localizations.terms),
                  ),
                );
              },
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 22.h),

            Obx(() {
                return controller.loading.isTrue ? const Center(child: CircularProgressIndicator()) : RegisterButton(
                  title: context.localizations.signUp,
                  onPressed: () async{
                    await controller.performRegister();
                    // Navigator.pushNamed(context, '/otp_screen');
                  },
                );
              }
            ),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TermsAndConditions(
                  title: context.localizations.already,
                  onTitle: context.localizations.signIn,
                  onPressed: () {
                    Navigator.pushNamed(context, KeyRoutes.loginScreen);
                    controller.clear();
                  },
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}