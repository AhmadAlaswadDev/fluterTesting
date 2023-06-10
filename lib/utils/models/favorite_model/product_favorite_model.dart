class ProductFavoriteModel {
  int? id;
  String? name;
  String? logo;
  int? rating;
  double? distance;
  String? address;
  String? saved;
  bool? isFavorite;
  List<Products>? products;

  ProductFavoriteModel(
      {this.id,
        this.name,
        this.logo,
        this.rating,
        this.distance,
        this.address,
        this.saved,
        this.isFavorite,
        this.products});

  ProductFavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    rating = json['rating'];
    distance = json['distance'];
    address = json['address'];
    saved = json['saved'];
    isFavorite = json['is_favorite'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

}

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
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
