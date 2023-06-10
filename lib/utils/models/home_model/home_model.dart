import 'home_best_seller_model.dart';
import 'home_categories_model.dart';
import 'home_nearby_model.dart';

class HomeModel {
  List<HomeCategoriesModel>? categories;
  List<HomeBestSellerModel>? bestSellers;
  List<HomeNearbyModel>? nearby;

  HomeModel({this.categories, this.bestSellers, this.nearby});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['Categories'] != null) {
      categories = <HomeCategoriesModel>[];
      json['Categories'].forEach((v) {
        categories!.add(HomeCategoriesModel.fromJson(v));
      });
    }
    if (json['Best Sellers'] != null) {
      bestSellers = <HomeBestSellerModel>[];
      json['Best Sellers'].forEach((v) {
        bestSellers!.add(HomeBestSellerModel.fromJson(v));
      });
    }
    if (json['nearby'] != null) {
      nearby = <HomeNearbyModel>[];
      json['nearby'].forEach((v) {
        nearby!.add(HomeNearbyModel.fromJson(v));
      });
    }
  }

}
