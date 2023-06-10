import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';


class PoliciesApiController with Helpers {

  Future<String> showPrivacyPolicies() async {
    var url = Uri.parse(ApiSettings.privacyPolicies);
    var response = await http.get(url, headers: headers);
    debugPrint('mmm3=>${response.statusCode}');
    debugPrint('mmm3=>${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch privacy policy');
    }
  }

  Future<String> showTermsPolicies() async {
    var url = Uri.parse(ApiSettings.termsPolicies);
    var response = await http.get(url, headers: headers);
    debugPrint('mmm3=>${response.statusCode}');
    debugPrint('mmm3=>${response.body}');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch privacy policy');
    }
  }

}
