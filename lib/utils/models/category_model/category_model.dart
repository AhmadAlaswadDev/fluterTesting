
class CategoryModel {
  int? id;
  String? name;
  String? banner;
  String? icon;
  int? numberOfChildren;
  Links? links;

  CategoryModel(
      {this.id,
        this.name,
        this.banner,
        this.icon,
        this.numberOfChildren,
        this.links});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    banner = json['banner'];
    icon = json['icon'];
    numberOfChildren = json['number_of_children'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

}

class Links {
  String? products;
  String? subCategories;

  Links({this.products, this.subCategories});

  Links.fromJson(Map<String, dynamic> json) {
    products = json['products'];
    subCategories = json['sub_categories'];
  }

}
