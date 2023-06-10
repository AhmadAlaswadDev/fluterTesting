import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';
import '../../models/favorite_model/product_favorite_model.dart';

class ProductFavoriteApiController with Helpers {

  Future<List<ProductFavoriteModel>> showProductFavorite() async {
    var url = Uri.parse(ApiSettings.productFavorite);
    var response = await http.get(url,
        headers: headers
    );
    debugPrint('mmm3=>${response.statusCode}');
    debugPrint('mmm3=>${response.body}');
    if (response.statusCode == 200) {
      List<ProductFavoriteModel> list=[];
      var productFavoriteJsonArray = jsonDecode(response.body)['data'] as List;
      productFavoriteJsonArray.forEach((element) {
        var object = ProductFavoriteModel.fromJson(element);
        list.add(object);
      });
      return list;
    }else{
/////////////////
      debugPrint('mmm faild =>${response.body}');
      throw Exception('Failed');
    }
  }

}