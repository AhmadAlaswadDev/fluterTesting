import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zaheed/utils/models/category_model/category_model.dart';

import '../../../../helpers/helpers.dart';
import '../../apis/api_settings.dart';

class CategoryApiController with Helpers{

  Future<List<CategoryModel>> showCategory() async {
    var url = Uri.parse(ApiSettings.category);
    var response = await http.get(url,
        // headers: headers
    );
    if (response.statusCode == 200) {
      List<CategoryModel> list=[];
      var categoryJsonArray = jsonDecode(response.body)['data'] as List;
      categoryJsonArray.forEach((element) {
        var object = CategoryModel.fromJson(element);
        list.add(object);
      });
      return list;
    }else{
/////////////////
    }
    return [];
  }

}