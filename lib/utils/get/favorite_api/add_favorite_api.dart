import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/extensions/color_resource.dart';
import '../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';

class AddFavoriteApiController with Helpers {

  Future<bool> addShopFavorite({required int shopId}) async {

    var url = Uri.parse(ApiSettings.addShopFavorite);
    var response = await http.post(url,
        body: {
          'shop_id': shopId.toString(),
        },
        headers: headers
    );
    // debugPrint('mmm addShopFavorite=>${response.statusCode}');
    if(response.statusCode == 200){
      Get.snackbar(
        'Add Success', //"Add Success",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if(response.statusCode == 400){
      Get.snackbar(
        'Add Failed', //"Add Failed",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> addProductFavorite({required int productId}) async {

    var url = Uri.parse(ApiSettings.addProductFavorite);
    var response = await http.post(url,
        body: {
          'product_id': productId.toString(),
        },
        headers: headers
    );
    debugPrint('mmm addProductFavorite=>${response.statusCode}');
    if(response.statusCode == 200){
      Get.snackbar(
        'Add Success', //"Add Success",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if(response.statusCode == 400){
      Get.snackbar(
        'Add Failed', //"Add Failed",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

}