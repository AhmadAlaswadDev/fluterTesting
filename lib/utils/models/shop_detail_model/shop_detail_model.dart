class ShopDetailModel {
  int? id;
  int? userId;
  String? name;
  String? title;
  String? description;
  String? logo;
  List<String>? sliders;
  int? slidersId;
  String? address;
  int? products;
  int? orders;
  String? saved;
  String? topDiscount;
  String? refundPolicy;
  String? latitude;
  String? longitude;
  String? workingHours;
  bool? isFavorite;

  ShopDetailModel(
      {this.id,
        this.userId,
        this.name,
        this.title,
        this.description,
        this.logo,
        this.sliders,
        this.slidersId,
        this.address,
        this.products,
        this.orders,
        this.saved,
        this.topDiscount,
        this.refundPolicy,
        this.latitude,
        this.longitude,
        this.workingHours,
        this.isFavorite});

  ShopDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    logo = json['logo'];
    sliders = json['sliders'].cast<String>();
    slidersId = json['sliders_id'];
    address = json['address'];
    products = json['products'];
    orders = json['orders'];
    saved = json['saved'];
    topDiscount = json['top_discount'];
    refundPolicy = json['refund_policy'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    workingHours = json['working_hours'];
    isFavorite = json['is_favorite'];
  }

}
