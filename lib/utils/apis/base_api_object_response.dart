import '../models/product_detail_model/product_detail_model.dart';
import '../models/user/user_model.dart';
import 'base_api_response.dart';

class BaseApiObjectResponse<T> extends BaseApiResponse {
  late T data;

  BaseApiObjectResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    print('mmm=> 0000001');
    if (json.containsKey('data')) {
      if (T == User) {
        data = User.fromJson(json['data']) as T;
      } else if (T == ProductDetailModel) {
        data = ProductDetailModel.fromJson(json['data']) as T;
        print('mmm=> 0000001');
      }
    }

  }
}
