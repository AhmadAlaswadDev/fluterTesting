import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/auth/login/views/screens/login_screen.dart';

import '../../../../../utils/get/auth_api_controller/auth_api_controller.dart';
import '../../../../../utils/models/user/user_model.dart';

class RegistrationController extends GetxController {

  RxBool loading = false.obs;
  var isPasswordShow = false.obs;

  var phone = ''.obs;

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController passController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }

  void clear(){
    nameController.clear();
    phoneController.clear();
    phone.value = '';
    passController.clear();
  }

  Future<void> performRegister() async {
    loading.value = true;
    if (checkData()) {
      await register();
    }
    loading.value = false;
  }

  bool checkData() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar(
      'Requires', //"Verification Failed",
      'Enter Required',
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  Future<void> register() async {
    bool status = await AuthApiController().register(user: user);
    if (status) {
      Get.off(LoginScreen());
      clear();
    }
  }

  User get user {
    User user = User();
    user.name = nameController.text;
    user.phone = phone.value.toString();
    user.password = passController.text;
    return user;
  }

}
