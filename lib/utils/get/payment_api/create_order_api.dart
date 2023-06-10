import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/apis/api_settings.dart';
import 'package:zaheed/utils/models/payment_model/create_order_model.dart';

import '../../../../helpers/helpers.dart';


class CreateOrderApiController with Helpers{

  Future<CreateOrderModel> createOrder(/*{required int ownerId,required int userId,required String paymentType,required String pickupTime}*/) async {
    var url = Uri.parse(ApiSettings.createOrder);
    var response = await http.post(
        url,
        body: {
          "owner_id":'173',
          "user_id":'8',
          "payment_type": "cash_on_pickup",
          "preferred_time_to_pick_up":"now"
        },
        headers: headers
    );
    debugPrint('mmm createOrder =>${response.statusCode}');
    debugPrint('mmm createOrder =>${response.body}');
    if (response.statusCode == 200) {
      var createOrderJsonArray = jsonDecode(response.body);
      CreateOrderModel createOrder = CreateOrderModel.fromJson(createOrderJsonArray);
      return createOrder;

    }else{
/////////////////
      debugPrint('mmm Failed =>${response.body}');
      throw Exception('Failed');
    }
  }

}