class ProductPageModel {
  int? id;
  String? name;
  String? thumbnailImage;
  bool? hasDiscount;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  int? sales;
  bool? isFavorite;
  Shop? shop;

  ProductPageModel(
      {this.id,
        this.name,
        this.thumbnailImage,
        this.hasDiscount,
        this.discount,
        this.strokedPrice,
        this.mainPrice,
        this.sales,
        this.isFavorite,
        this.shop});

  ProductPageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnailImage = json['thumbnail_image'];
    hasDiscount = json['has_discount'];
    discount = json['discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
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
