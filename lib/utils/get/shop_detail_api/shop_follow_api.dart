import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/extensions/color_resource.dart';
import '../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';

class ShopFollowApiController with Helpers {

  Future<bool> shopFollow({required int shopId}) async {

    var url = Uri.parse(ApiSettings.shopFollow + shopId.toString());
    var response = await http.get(
        url,
        headers: headers
    );
    debugPrint('mmm shopFollow=>${response.statusCode}');
    if(response.statusCode == 200){
      Get.snackbar(
        'Follow Success', //"Follow Success",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if(response.statusCode == 400){
      Get.snackbar(
        'Follow Failed', //"Follow Failed",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> shopUnFollow({required int shopId}) async {

    var url = Uri.parse(ApiSettings.shopUnfollow + shopId.toString());
    var response = await http.get(
        url,
        headers: headers
    );
    debugPrint('mmm shopUnFollow=>${response.statusCode}');
    if(response.statusCode == 200){
      Get.snackbar(
        'UnFollow Success', //"UnFollow Success",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if(response.statusCode == 400){
      Get.snackbar(
        'UnFollow Failed', //"UnFollow Failed",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

}