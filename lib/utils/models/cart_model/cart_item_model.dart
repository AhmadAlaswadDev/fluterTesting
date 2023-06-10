class CartItemsModel {
  int? id;
  int? ownerId;
  int? userId;
  int? productId;
  String? productName;
  String? productThumbnailImage;
  String? variation;
  int? price;
  String? discount;
  String? discountType;
  String? currencySymbol;
  int? tax;
  int? shippingCost;
  int? quantity;
  int? lowerLimit;
  int? upperLimit;

  CartItemsModel(
      {this.id,
        this.ownerId,
        this.userId,
        this.productId,
        this.productName,
        this.productThumbnailImage,
        this.variation,
        this.price,
        this.discount,
        this.discountType,
        this.currencySymbol,
        this.tax,
        this.shippingCost,
        this.quantity,
        this.lowerLimit,
        this.upperLimit});

  CartItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productThumbnailImage = json['product_thumbnail_image'];
    variation = json['variation'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discount_type'];
    currencySymbol = json['currency_symbol'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    quantity = json['quantity'];
    lowerLimit = json['lower_limit'];
    upperLimit = json['upper_limit'];
  }

}