class ShopPageModel {
  int? id;
  String? name;
  int? productsCount;

  ShopPageModel({this.id, this.name, this.productsCount});

  ShopPageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productsCount = json['products_count'];
  }

}
