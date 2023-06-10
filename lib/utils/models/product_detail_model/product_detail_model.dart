import 'package:zaheed/utils/models/product_detail_model/photos.dart';
import 'brand.dart';

class ProductDetailModel {
  int? id;
  String? name;
  String? addedBy;
  int? sellerId;
  int? shopId;
  String? shopName;
  String? shopLogo;
  List<Photos>? photos;
  String? thumbnailImage;
  List<String>? tags;
  String? priceHighLow;
  // List<Null>? choiceOptions;
  // List<Null>? colors;
  bool? hasDiscount;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  int? calculablePrice;
  String? currencySymbol;
  int? currentStock;
  String? unit;
  int? rating;
  int? ratingCount;
  int? earnPoint;
  String? description;
  String? videoLink;
  Brand? brand;
  String? link;

  ProductDetailModel(
      {this.id,
        this.name,
        this.addedBy,
        this.sellerId,
        this.shopId,
        this.shopName,
        this.shopLogo,
        this.photos,
        this.thumbnailImage,
        this.tags,
        this.priceHighLow,
        // this.choiceOptions,
        // this.colors,
        this.hasDiscount,
        this.discount,
        this.strokedPrice,
        this.mainPrice,
        this.calculablePrice,
        this.currencySymbol,
        this.currentStock,
        this.unit,
        this.rating,
        this.ratingCount,
        this.earnPoint,
        this.description,
        this.videoLink,
        this.brand,
        this.link});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addedBy = json['added_by'];
    sellerId = json['seller_id'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopLogo = json['shop_logo'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    thumbnailImage = json['thumbnail_image'];
    tags = json['tags'].cast<String>();
    priceHighLow = json['price_high_low'];
    if (json['choice_options'] != null) {
      // choiceOptions = <Null>[];
      json['choice_options'].forEach((v) {
        // choiceOptions!.add(new Null.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      // colors = <Null>[];
      json['colors'].forEach((v) {
        // colors!.add(new Null.fromJson(v));
      });
    }
    hasDiscount = json['has_discount'];
    discount = json['discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    calculablePrice = json['calculable_price'];
    currencySymbol = json['currency_symbol'];
    currentStock = json['current_stock'];
    unit = json['unit'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    earnPoint = json['earn_point'];
    description = json['description'];
    videoLink = json['video_link'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    link = json['link'];
  }

}
