
import 'package:zaheed/utils/models/cart_model/cart_item_model.dart';

class DataModel {
  String? name;
  int? ownerId;
  String? address;
  String? logo;
  String? saved;
  List<CartItemsModel>? cartItemsModel;

  DataModel(
      {this.name,
        this.ownerId,
        this.address,
        this.logo,
        this.saved,
        this.cartItemsModel});

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ownerId = json['owner_id'];
    address = json['address'];
    logo = json['logo'];
    saved = json['saved'];
    if (json['cart_items'] != null) {
      cartItemsModel = <CartItemsModel>[];
      json['cart_items'].forEach((v) {
        cartItemsModel!.add(CartItemsModel.fromJson(v));
      });
    }
  }

}