import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:zaheed/features/app/auth/otp/views/screens/otp_screen.dart';
import 'package:zaheed/features/app/dashboard/views/dashboard_screen.dart';

import '../../../../../utils/extensions/color_resource.dart';
import '../../../../../utils/get/auth_api_controller/auth_api_controller.dart';

class LoginController extends GetxController {

  RxBool loading = false.obs;

  var phone = ''.obs;
  var reCAPTCHAToken = ''.obs;

  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void clear(){
    phoneController.clear();
    phone.value = '';
    reCAPTCHAToken.value = '';
  }

  Future<void> performLogin() async {
    loading.value = true;
    if (checkData()) {
      print('mmmmm=> am at preform register updatetdsad ');
      await login();
    }
    loading.value = false;
  }

  bool checkData() {
    if (phoneController.text.isNotEmpty ) {
      //  && reCAPTCHAToken.isNotEmpty
      return true;
    }
    Get.snackbar(
      'Requires ${phoneController.text}',
      'Enter Required',
      backgroundColor: ColorResource.red,
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  Future<void> login() async {
    print("mmm in=> am at login controller updatefresfsefsedf");
    bool status = await AuthApiController().loginWithPhone(mobile: phone.value.toString());
    //  reCAPTCHAToken: reCAPTCHAToken.value.toString()
    if (status) {
      Get.off(const DashboardScreen());
      clear();
      // Get.to(const OTPScreen());
      // clear();
    }
    else{
      loading.value = false;
    }
  }


}
