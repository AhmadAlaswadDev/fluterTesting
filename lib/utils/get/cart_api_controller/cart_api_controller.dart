import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'package:http/http.dart' as http;
import 'package:zaheed/utils/apis/api_settings.dart';
import 'package:zaheed/utils/models/cart_model/cart_item_model.dart';
import 'package:zaheed/utils/models/cart_model/cart_model.dart';
import 'package:zaheed/utils/models/cart_model/data_model.dart';
import 'package:zaheed/utils/models/cart_model/summary_model.dart';

import '../../../../helpers/helpers.dart';
import '../../extensions/color_resource.dart';

class CartApiController with Helpers{

  Future<SummaryModel> showSummaryCart() async {
    var url = Uri.parse(ApiSettings.carts);
    var response = await http.get(
        url,
        headers:headers
    );

    var resp=jsonDecode(response.body);
    if (response.statusCode == 200 && resp['success']) {
      var cartJsonArray = jsonDecode(response.body)['summary'];
      SummaryModel summaryCart = SummaryModel.fromJson(cartJsonArray);
      return summaryCart;

    }else{
/////////////////
      throw Exception('Failed');
    }
  }

  Future<List<DataModel>> showDataCart() async {
    var url = Uri.parse(ApiSettings.carts);
    var response = await http.get(
        url,
        headers:headers
    );

    if (response.statusCode == 200) {
      List<DataModel> list=[];
      var cartDataJsonArray = jsonDecode(response.body)['data'] as List;
      cartDataJsonArray.forEach((element) {
        var object = DataModel.fromJson(element);
        list.add(object);
      });
      return list;
    }else{
/////////////////
      throw Exception('Failed');
    }
  }

  Future<List<CartItemsModel>> showCartItem() async {
    var url = Uri.parse(ApiSettings.carts);
    var response = await http.get(
        url,
        headers:headers
    );

    var resp=jsonDecode(response.body);
    if (response.statusCode == 200 && resp['success']) {
      List<CartItemsModel> list=[];
      var cartItemJsonArray = jsonDecode(response.body)['data']; 
      // [0]['cart_items'] as List;
      // cartItemJsonArray.forEach((element) {
      //   var object = CartItemsModel.fromJson(element);
      //   list.add(object);
      // });
      return list;
    }else{
/////////////////
      throw Exception('Failed');
    }
  }

  Future<bool> addItem({required int itemId, required int quantity}) async {

    var url = Uri.parse(ApiSettings.addShopFavorite);
    var response = await http.post(url,
        body: {
          "id": itemId.toString(),
          "variant":"",
          "user_id":'8',
          "quantity": quantity.toString()
        },
        headers: headers
    );
    if(response.statusCode == 200){
      Get.snackbar(
        'Add Success', //"Add Success",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if(response.statusCode == 400){
      Get.snackbar(
        'Add Failed', //"Add Failed",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> removeItem({required int itemId}) async {
    var url = Uri.parse("${ApiSettings.removeItem}$itemId");
    var response = await http.delete(url,
        headers: headers
    );
    if(response.statusCode == 200){
      Get.snackbar(
        'Remove Success', //"Remove Success",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }else if(response.statusCode == 400){
      Get.snackbar(
        'Remove Failed', //"Remove Failed",
        '${jsonDecode(response.body)['message']}',
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

}