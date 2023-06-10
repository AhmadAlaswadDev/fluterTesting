class NearByStoreModel {
  int? id;
  String? name;
  String? logo;
  int? rating;
  double? distance;

  NearByStoreModel({this.id, this.name, this.logo, this.rating, this.distance});

  NearByStoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    rating = json['rating'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['rating'] = this.rating;
    data['distance'] = this.distance;
    return data;
  }
}
