import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';
import '../../models/shop_category_model/shop_category_model.dart';

class ShopCategoryApiController with Helpers{

  Future<ShopCategoryModel> showShopCategory(int idCategory,{required double latitude,required double longitude}) async {
    var url = Uri.parse(ApiSettings.shopCategory + idCategory.toString());
    var response = await http.post(
        url,
        body: {
          "latitude":"$latitude",
          "longitude":"$longitude",
          "distance":"40"
        },
        headers: headers
    );
    debugPrint('mmm1s=>${response.statusCode}');
    debugPrint('mmm1s=>${response.body}<= the data last here 💯 😍');
    if (response.statusCode == 200) {
      var shopCategoryJsonArray = jsonDecode(response.body)['data'];
      ShopCategoryModel shopCategory = ShopCategoryModel.fromJson(shopCategoryJsonArray);
      return shopCategory;

    }else{
/////////////////
      debugPrint('mmm faild =>${response.body}');
      throw Exception('Failed');
    }
  }

}