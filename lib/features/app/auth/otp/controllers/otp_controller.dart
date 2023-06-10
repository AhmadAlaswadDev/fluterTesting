
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/dashboard/views/dashboard_screen.dart';

import '../../../../../utils/extensions/color_resource.dart';
import '../../../../../utils/get/auth_api_controller/auth_api_controller.dart';

class OTPController extends GetxController {

  static OTPController get to => Get.find<OTPController>();

  RxBool loading = false.obs;
  var otpCode = ''.obs;

  late TextEditingController otpController;

  // final _durationTimeOut = const Duration(seconds: 25);
  // final isCanResendCode = false.obs;
  // final durationCountdown = 0.obs;

  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
  }

  // @override
  // void dispose() {
  //   otpController.dispose();
  //   super.dispose();
  // }

  void clear(){
    otpController.clear();
    otpCode.value = '';
  }

  Future<void> verifyPhoneNumber() async {
    loading.value = true;
    if (checkData()) {
      await verifySmsCode();
    }
    loading.value = false;
  }

  bool checkData() {
    if (otpController.text.isNotEmpty && otpCode.value.isNotEmpty) {
      return true;
    }
    Get.snackbar(
      'Require',
      'Enter Verification Code!',
      backgroundColor: ColorResource.red,
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  Future<void> verifySmsCode() async {
    bool status = await AuthApiController().activatePhone(verificationCode: otpCode.value.toString());
    if (status) {
      Get.off(const DashboardScreen());
      clear();
    }
  }

// void _validateCountdownResendCode() {
//   isCanResendCode.value = false;
//   var maxDurationInSecond = _durationTimeOut.inSeconds;
//   var currentDurationSecond = 0;
//   durationCountdown.value = maxDurationInSecond;
//
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     currentDurationSecond++;
//     if (maxDurationInSecond - currentDurationSecond >= 0) {
//       durationCountdown.value = maxDurationInSecond - currentDurationSecond;
//     } else {
//       isCanResendCode.value = true;
//       timer.cancel();
//     }
//   });
// }

}
