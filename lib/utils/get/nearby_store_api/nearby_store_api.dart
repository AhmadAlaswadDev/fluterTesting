import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';
import '../../models/nearby_store_model/nearby_store_model.dart';

class NearByApiController with Helpers{

  Future<List<NearByStoreModel>> showNearByStore({required double latitude,required double longitude}) async {
    var url = Uri.parse(ApiSettings.nearByStore);
    var response = await http.post(
      url,
      body: {
        "latitude":"$latitude",
        "longitude":"$longitude",
        "distance":"40"
      },
      // headers: headers
    );
    if (response.statusCode == 200) {
      List<NearByStoreModel> list=[];
      var nearByJsonArray = jsonDecode(response.body)['data'] as List;
      nearByJsonArray.forEach((element) {
        var object = NearByStoreModel.fromJson(element);
        list.add(object);
      });
      return list;
    }else{
/////////////////
    }
    return [];
  }

}