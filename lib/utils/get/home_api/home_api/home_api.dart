import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/extensions/color_resource.dart';

import '../../../../helpers/helpers.dart';
import '../../../apis/api_settings.dart';
import '../../../models/home_model/home_model.dart';

class HomeApiController with Helpers{

  Future<HomeModel> showHomeLayout({required double latitude,required double longitude}) async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.post(
      url,
      body: {
        "latitude":"$latitude",
        "longitude":"$longitude",
        "distance":"120"
      },
      headers: headers
    );
    var resp=jsonDecode(response.body);
    if (response.statusCode == 200 && resp['success'] ) {
      var homeJsonArray = resp['data'];
        HomeModel homeModel = HomeModel.fromJson(homeJsonArray);
        return homeModel;
    }else{
/////////////////
      debugPrint('mmm faild =>${response.body}');
      throw Exception('Failed');
    }
  }

}