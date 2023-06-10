import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/extensions/color_resource.dart';
import '../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';

class RemoveFavoriteApiController with Helpers {

  Future<bool> removeShopFavorite({required int shopId}) async {

    var url = Uri.parse(ApiSettings.removeShopFavorite);
    var response = await http.post(url,
        body: {
          'shop_id': shopId.toString(),
        },
        headers: headers
    );
    // debugPrint('mmm removeShopFavorite=>${response.statusCode}');
    if(response.statusCode == 200){
      Get.snackbar(
        'Remove Success', //"Remove Success",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if(response.statusCode == 400){
      Get.snackbar(
        'Remove Failed', //"Remove Failed",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> removeProductFavorite({required int productId}) async {

    var url = Uri.parse(ApiSettings.removeProductFavorite);
    var response = await http.post(url,
        body: {
          'product_id': productId.toString(),
        },
        headers: headers
    );
    // debugPrint('mmm removeProductFavorite=>${response.statusCode}');
    if(response.statusCode == 200){
      Get.snackbar(
        'Remove Success', //"Remove Success",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if(response.statusCode == 400){
      Get.snackbar(
        'Remove Failed', //"Remove Failed",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

}