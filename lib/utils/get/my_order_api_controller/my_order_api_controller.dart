import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/apis/api_settings.dart';
import 'package:zaheed/utils/models/my_order_model/my_order_model.dart';


import '../../../../helpers/helpers.dart';

class MyOrderApiController with Helpers{

  Future<List<MyOrderModel>> showMyOrder() async {
    var url = Uri.parse(ApiSettings.myOrder);
    var response = await http.get(
        url,
        headers: headers
    );
    if (response.statusCode == 200) {
      var myOrderJsonArray = jsonDecode(response.body)['data'] as List;
      return myOrderJsonArray.map((jsonObject) => MyOrderModel.fromJson(jsonObject))
          .toList();

    }else{
/////////////////
      debugPrint('mmm Failed =>${response.body}');
      throw Exception('Failed');
    }
  }

}