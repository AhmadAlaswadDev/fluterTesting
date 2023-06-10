import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/models/page_model/product_page_model.dart';
import 'package:zaheed/utils/models/page_model/shop_page_model.dart';

import '../../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';

class PageApiController with Helpers{

  Future<List<ShopPageModel>> showShopPages(int shopId) async {
    var url = Uri.parse('${ApiSettings.shopPages}$shopId/pages');
    var response = await http.get(
        url,
        headers: headers
    );
    var resp=jsonDecode(response.body);
    if (response.statusCode == 200 && resp['success']) {
      var shopPageJsonArray = resp['data'] as List;
      return shopPageJsonArray.map((jsonObject) => ShopPageModel.fromJson(jsonObject))
          .toList();

    }else{

      throw Exception('Failed');
    }
  }


  Future<List<ProductPageModel>> showProductPages(int shopId, int pageId) async {
    var url = Uri.parse('${ApiSettings.productPages}$shopId/pages/$pageId');
    var response = await http.get(
        url,
        headers: headers
    );

    if (response.statusCode == 200) {
      var productPageJsonArray = jsonDecode(response.body)['data'] as List;
      return productPageJsonArray.map((jsonObject) => ProductPageModel.fromJson(jsonObject))
          .toList();

    }else{
      debugPrint('mmm Failed =>${response.body}');
      throw Exception('Failed');
    }
  }

}