class Photos {
  String? variant;
  String? path;


  Photos.fromJson(Map<String, dynamic> json) {
    variant = json['variant'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant'] = variant;
    data['path'] = path;
    return data;
  }
}