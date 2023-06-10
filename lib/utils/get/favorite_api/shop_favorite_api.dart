import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';
import '../../models/favorite_model/shop_favorite_model.dart';

class ShopFavoriteApiController with Helpers {

  Future<List<ShopsFavoriteModel>> showShopFavorite() async {
    var url = Uri.parse(ApiSettings.shopFavorite);
    var response = await http.get(url,
      headers: headers
    );
    debugPrint('mmm shopFavorite=>${response.statusCode}');
    debugPrint('mmm shopFavorite=>${response.body}');
    if (response.statusCode == 200) {
      List<ShopsFavoriteModel> list=[];
      var shopFavoriteJsonArray = jsonDecode(response.body)['data'] as List;
      shopFavoriteJsonArray.forEach((element) {
        var object = ShopsFavoriteModel.fromJson(element);
        list.add(object);
      });
      // debugPrint('mmm3=>shopFavoriteJsonArray');
      return list;
    }else{
/////////////////
    }
    return [];
  }

}