
class HomeNearbyModel {
  int? id;
  String? name;
  String? logo;
  int? rating;
  double? distance;
  String? address;
  String? shopCategory;

  HomeNearbyModel(
      {this.id,
        this.name,
        this.logo,
        this.rating,
        this.distance,
        this.address,
        this.shopCategory});

  HomeNearbyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    rating = json['rating'];
    distance = json['distance'];
    address = json['address'];
    shopCategory = json['shop_category'];
  }

}