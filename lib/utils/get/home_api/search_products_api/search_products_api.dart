import 'package:zaheed/utils/models/search_products_model/search_products_model.dart';

import '../../../../helpers/helpers.dart';
import '../../../apis/api_settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchProductApiController with Helpers{

  Future<List<SearchProductsModel>> searchProducts() async {
    var url = Uri.parse(ApiSettings.searchProducts);
    var response = await http.get(url,
      // headers: headers
    );

    // debugPrint('mmm1=>${response.statusCode}');
    // debugPrint('mmm1=>${response.body}');
    if (response.statusCode == 200) {
      List<SearchProductsModel> list=[];
      var baseResponse = jsonDecode(response.body)['data'] as List;
      baseResponse.forEach((element) {
        var object = SearchProductsModel.fromJson(element);
        list.add(object);
      });
      return list;
    }else{
/////////////////
    }
    return [];
  }

}