import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../apis/api_settings.dart';
import '../../models/best_seller_model/best_seller_model.dart';

class BestSellerApiController {
  Future<List<BestSellerModel>> showBestSelling() async {
    var url = Uri.parse(ApiSettings.bestSeller);
    var response = await http.get(url,
      // headers: headers
    );
    if (response.statusCode == 200) {
      List<BestSellerModel> list=[];
      var bestSellingJsonArray = jsonDecode(response.body)['data'] as List;
      bestSellingJsonArray.forEach((element) {
        var object = BestSellerModel.fromJson(element);
        list.add(object);
      });
      // debugPrint('mmm3=>$bestSellingJsonArray');
      return list;
    }else{
/////////////////
    }
    return [];
  }
}