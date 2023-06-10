
class HomeCategoriesModel {
  int? id;
  String? name;
  String? image;

  HomeCategoriesModel({this.id, this.name, this.image});

  HomeCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

}