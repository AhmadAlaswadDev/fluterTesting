class User {
  int? id;
  String? type;
  String? name;
  String? email;
  String? avatar;
  String? avatarOriginal;
  String? phone;
  String? password;
  String? saved;

  User(
      {this.id,
        this.type,
        this.name,
        this.email,
        this.avatar,
        this.avatarOriginal,
        this.phone,
        this.saved});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    phone = json['phone'];
    saved = json['saved'];
  }

}
