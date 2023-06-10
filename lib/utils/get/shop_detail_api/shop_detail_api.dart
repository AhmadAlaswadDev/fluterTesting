import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';
import '../../models/shop_detail_model/shop_detail_model.dart';

class ShopDetailApiController with Helpers{

  Future<ShopDetailModel> showShopCategory(int idShop) async {
    var url = Uri.parse(ApiSettings.shopDetail + idShop.toString());
    var response = await http.get(
        url,
        headers: headers
    );
    var resp=jsonDecode(response.body);
    if (response.statusCode == 200 && resp['success']) {
      var shopDetailJsonArray = resp['data'];
      ShopDetailModel shopDetail = ShopDetailModel.fromJson(shopDetailJsonArray);
      return shopDetail;

    }else{
/////////////////
      debugPrint('mmm faild am =>${response.body}');
      throw Exception('Failed');
    }
  }

}