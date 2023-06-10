// class NewUserModel {
//   bool? result;
//   String? message;
//   String? accessToken;
//   String? tokenType;
//   String? expiresAt;
//   NewUser? user;
//
//   NewUserModel(
//       {this.result,
//         this.message,
//         this.accessToken,
//         this.tokenType,
//         this.expiresAt,
//         this.user});
//
//   NewUserModel.fromJson(Map<String, dynamic> json) {
//     result = json['result'];
//     message = json['message'];
//     accessToken = json['access_token'];
//     tokenType = json['token_type'];
//     expiresAt = json['expires_at'];
//     user = json['user'] != null ?  NewUser.fromJson(json['user']) : null;
//   }
//
// }
//
// // class NewUser {
// //   int? id;
// //   String? type;
// //   String? name;
// //   String? email;
// //   String? avatar;
// //   String? avatarOriginal;
// //   String? phone;
// //
// //   NewUser(
// //       {this.id,
// //         this.type,
// //         this.name,
// //         this.email,
// //         this.avatar,
// //         this.avatarOriginal,
// //         this.phone});
// //
// //   NewUser.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     type = json['type'];
// //     name = json['name'];
// //     email = json['email'];
// //     avatar = json['avatar'];
// //     avatarOriginal = json['avatar_original'];
// //     phone = json['phone'];
// //   }
// //
// // }
