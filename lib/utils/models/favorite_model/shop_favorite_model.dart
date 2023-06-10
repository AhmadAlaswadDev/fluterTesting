
class ShopsFavoriteModel {
  int? id;
  Shop? shop;

  ShopsFavoriteModel({this.id, this.shop});

  ShopsFavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
  }

}

class Shop {
  int? id;
  String? name;
  String? logo;
  int? rating;
  double? distance;
  String? address;

  Shop(
      {this.id,
        this.name,
        this.logo,
        this.rating,
        this.distance,
        this.address});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    rating = json['rating'];
    distance = json['distance'];
    address = json['address'];
  }

}
