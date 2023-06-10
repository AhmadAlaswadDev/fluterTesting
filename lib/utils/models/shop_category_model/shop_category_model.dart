
import 'package:zaheed/utils/models/shop_category_model/shop_category_best_seller_model.dart';
import 'package:zaheed/utils/models/shop_category_model/shop_category_categories_model.dart';
import 'package:zaheed/utils/models/shop_category_model/shop_category_nearby_model.dart';

class ShopCategoryModel {
  List<Categories>? categories;
  List<BestSellers>? bestSellers;
  List<Nearby>? nearby;

  ShopCategoryModel({this.categories, this.bestSellers, this.nearby});

  ShopCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['Best Sellers'] != null) {
      bestSellers = <BestSellers>[];
      json['Best Sellers'].forEach((v) {
        bestSellers!.add(BestSellers.fromJson(v));
      });
    }
    if (json['nearby'] != null) {
      nearby = <Nearby>[];
      json['nearby'].forEach((v) {
        nearby!.add(Nearby.fromJson(v));
      });
    }
  }

}
