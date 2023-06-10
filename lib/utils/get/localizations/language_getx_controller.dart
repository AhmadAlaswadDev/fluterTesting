import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../prefs/shared_pref_controller.dart';

class LanguageGetxController extends GetxController {
  static LanguageGetxController get to => Get.find<LanguageGetxController>();
  RxString language = 'en'.obs;

  @override
  void onInit() {
    language.value = SharedPrefController().language;
    super.onInit();
  }

  void changeLanguage() {
    language.value = language.value == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(language: language.value);
  }
}
