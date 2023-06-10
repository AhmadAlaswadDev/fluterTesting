import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';

import '../../../helpers/helpers.dart';
import '../../../prefs/shared_pref_controller.dart';
import '../../apis/api_settings.dart';
import 'package:http/http.dart' as http;
import '../../models/user/base_user_model.dart';
import '../../models/user/user_model.dart';

class AuthApiController with Helpers{

  Future<bool> register({required User user}) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url,
        body: {
          "name": user.name,
          "email_or_phone": user.phone,
          "password": user.password,
          "password_confirmation": user.password,
          "register_by": "phone"
        },
        headers: headers
    );

    debugPrint('mmm=>b auth register ${response.statusCode}');
    if (response.statusCode == 200) {
      debugPrint('mmm=> auth register ${response.statusCode}');
      Get.snackbar(
        'Already registered successfully',
        '${jsonDecode(response.body)['message']['email_or_phone']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if (response.statusCode == 201) {
      debugPrint('mmm=> auth register ${response.statusCode}');
      Get.snackbar(
        'Registration Successful',
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } else if (response.statusCode == 400) {
      debugPrint('mmm=> auth register ${response.statusCode}');
      Get.snackbar(
        'Registration Failed', //"Verification Failed",
        '${jsonDecode(response.body)['message']['email_or_phone']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }else if (response.statusCode == 500) {
      debugPrint('mmm=> auth register ${response.statusCode}');
      Get.snackbar(
        'Registration Failed', //"Verification Failed",
        'Something went wrong, please try again!',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

  // Future<bool> loginWithPhone({required String mobile, required String reCAPTCHAToken}) async {
  Future<bool> loginWithPhone({required String mobile,  }) async {
    var url = Uri.parse(ApiSettings.loginWithPhone);
    var response = await http.post(
        url,
        body: {
          'phone_number': mobile,
          'recaptcha_token': 'sadsad',
          // 'recaptcha_token': reCAPTCHAToken,
        },
        headers: headers
    );
      print("mmm in=> am at loginWithPhoneRequest ${jsonDecode(response.body)}");
    if (response.statusCode == 200) {
      if(jsonDecode(response.body)['success']){
        var jsonObject = jsonDecode(response.body);
        BaseUserModel user = BaseUserModel.fromJson(jsonObject);
        await SharedPrefController().save(baseUser: user);
        Get.snackbar(
          'Welcome',
          jsonDecode(response.body)['message'],
          backgroundColor: ColorResource.green,
          snackPosition: SnackPosition.BOTTOM,
        );



        // var jsonObject = jsonDecode(response.body)['data'];
        // debugPrint("mmm in=> ${jsonObject}");
        // BaseUserModel user = BaseUserModel.fromJson(jsonObject);
        // debugPrint("mmm b=> ${user.sessionInfo}");
        // debugPrint("mmm b=> ${jsonDecode(response.body)['data']['sessionInfo']}");
        // await SharedPrefController().saveSessionInfo(baseUser: user);
        // debugPrint("mmm a=> ${jsonDecode(response.body)['data']['sessionInfo']}");
        // debugPrint("mmm a=> ${user.sessionInfo}");
        // Get.snackbar(
        //   'Welcome',
        //   jsonDecode(response.body)['message'],
        //   backgroundColor: ColorResource.green,
        //   snackPosition: SnackPosition.BOTTOM,
        // );
        
        return true;
      }
      else{
            Get.snackbar(
              'Login Failed',
              jsonDecode(response.body)['message'],
              backgroundColor: ColorResource.red,
              snackPosition: SnackPosition.BOTTOM,
            ); 
            return false;
      }
    } else if (response.statusCode == 400) {
      Get.snackbar(
        'Login Failed',
        jsonDecode(response.body)['message'],
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (response.statusCode == 401) {
      Get.snackbar(
        'Login Failed',
        jsonDecode(response.body)['message'],
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> activatePhone({required String verificationCode}) async {
    var url = Uri.parse(ApiSettings.activatePhone);
    var response = await http.post(
        url,
        body: {
          'session_id': SharedPrefController().sessionInfo,
          'verification_code': verificationCode,
        },
        headers: headers
    );
    debugPrint("mmm *=> ${SharedPrefController().sessionInfo}");
    debugPrint("mmm=> $verificationCode");
    debugPrint("mmm=> ${response.statusCode}");
    debugPrint("mmm=> ${response.body}");
    // debugPrint("mmm=> ${jsonDecode(response.body)['error']['code']}");
    if (response.statusCode == 200 || jsonDecode(response.body)['result'] == true) {
      var jsonObject = jsonDecode(response.body);
      BaseUserModel user = BaseUserModel.fromJson(jsonObject);
      await SharedPrefController().save(baseUser: user);
      Get.snackbar(
        'Welcome',
        jsonDecode(response.body)['message'],
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } else if (response.statusCode == 400 || jsonDecode(response.body)['error']['code'] == 400) {
      debugPrint("mmm 400=> ${response.body}");
      Get.snackbar(
        'Invalid Code',
        jsonDecode(response.body)['message'],
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (response.statusCode == 500 || jsonDecode(response.body)['error']['code'] == 500) {
      debugPrint("mmm 500=> ${response.body}");
      Get.snackbar(
        'Something went wrong',
        jsonDecode(response.body)['message'],
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return false;
  }

  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url,
        headers: headers
    );
    debugPrint('mmm=> ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }

}