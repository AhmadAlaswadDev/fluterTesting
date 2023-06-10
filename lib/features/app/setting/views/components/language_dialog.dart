

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/get/localizations/language_getx_controller.dart';
import 'package:zaheed/widgets/text_app.dart';

import '../../../../../utils/extensions/color_resource.dart';
import '../../../../../widgets/restart_app.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200.h,
        width: 280.w,
        color: ColorResource.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextApp(
              text: context.localizations.chooseLanguage,
              fontSize: 15.sp,
              color: ColorResource.secondary,
              fontWeight: FontWeight.w500,
            ),
            Divider(height: 10.h,thickness: 1.5.w, color: ColorResource.lightGray),
            InkWell(
              onTap: (){
                if (LanguageGetxController.to.language == 'en') {
                  setState(() {
                    LanguageGetxController.to.changeLanguage();
                    RestartWidget.restartApp(context);
                    Navigator.pop(context);
                  });
                }
              },
              child: TextApp(
                text: context.localizations.arabic,
                fontSize: 15.sp,
                color: ColorResource.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              onTap: (){
                if (LanguageGetxController.to.language == 'ar') {
                  setState(() {
                    LanguageGetxController.to.changeLanguage();
                    RestartWidget.restartApp(context);
                    Navigator.pop(context);
                  });
                }
              },
              child: TextApp(
                text: context.localizations.english,
                fontSize: 15.sp,
                color: ColorResource.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
