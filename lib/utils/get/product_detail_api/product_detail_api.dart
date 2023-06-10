import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';
import '../../models/product_detail_model/product_detail_model.dart';

class ProductDetailApiController with Helpers{

  Future<List<ProductDetailModel?>> showProductDetail(int idProduct) async {
    var url = Uri.parse(ApiSettings.productDetail + idProduct.toString());
    var response = await http.get(url,
      // headers: headers
    );

    if (response.statusCode == 200) {
      List<ProductDetailModel> list=[];
      var baseResponse = jsonDecode(response.body)['data'] as List;
      baseResponse.forEach((element) {
        var object = ProductDetailModel.fromJson(element);
        list.add(object);
      });
      return list;
    }else{
/////////////////
    }
    return [];
  }

}