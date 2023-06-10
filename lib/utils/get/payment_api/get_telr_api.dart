import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/apis/api_settings.dart';
import 'package:zaheed/utils/models/payment_model/create_order_model.dart';
import 'package:zaheed/utils/models/payment_model/get_telr_model.dart';

import '../../../../helpers/helpers.dart';


class GetTelrApiController with Helpers{

  Future<GetTelrModel> getTelr(/*{required int combinedOrderId}*/) async {
    var url = Uri.parse(ApiSettings.getTelrURL);
    var response = await http.post(
        url,
        body: {
          "combined_order_id":"19"
        },
        headers: headers
    );
    debugPrint('mmm getTelr =>${response.statusCode}');
    debugPrint('mmm getTelr =>${response.body}');
    if (response.statusCode == 200) {
      var telrJsonArray = jsonDecode(response.body)['data'];
      GetTelrModel getTelr = GetTelrModel.fromJson(telrJsonArray);
      return getTelr;

    }else{
/////////////////
      debugPrint('mmm Failed =>${response.body}');
      throw Exception('Failed');
    }
  }

}