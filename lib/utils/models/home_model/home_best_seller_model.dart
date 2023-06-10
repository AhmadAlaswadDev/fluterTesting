
class HomeBestSellerModel {
  int? id;
  String? name;
  String? thumbnailImage;
  bool? hasDiscount;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  int? rating;
  int? sales;
  bool? isFavorite;
  Shop? shop;

  HomeBestSellerModel(
      {this.id,
        this.name,
        this.thumbnailImage,
        this.hasDiscount,
        this.discount,
        this.strokedPrice,
        this.mainPrice,
        this.rating,
        this.sales,
        this.isFavorite,
        this.shop});

  HomeBestSellerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnailImage = json['thumbnail_image'];
    hasDiscount = json['has_discount'];
    discount = json['discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    rating = json['rating'];
    sales = json['sales'];
    isFavorite = json['is_favorite'];
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
  }

}

class Shop {
  int? id;
  String? name;
  String? logo;

  Shop({this.id, this.name, this.logo});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

}