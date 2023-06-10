class NotificationModel{
  int? id;
  String? title;
  String? body;
  DateTime? dateTime;
  bool isRead = false; // add isRead field

  NotificationModel(this.title, this.body, String? dateTimeString,
      {this.isRead = false}) {
    if (dateTimeString != null) {
      dateTime = DateTime.parse(dateTimeString);
    }
  }

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    dateTime = json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['dateTime'] = dateTime?.toIso8601String();
    return data;
  }

}
