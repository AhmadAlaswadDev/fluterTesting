import 'package:zaheed/utils/models/cart_model/data_model.dart';
import 'package:zaheed/utils/models/cart_model/summary_model.dart';

class CartModel {
  String? success;
  SummaryModel? summaryModel;
  List<DataModel>? dataModel;

  CartModel({this.success, this.summaryModel, this.dataModel});

  CartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    summaryModel =
    json['summary'] != null ? SummaryModel.fromJson(json['summary']) : null;
    if (json['data'] != null) {
      dataModel = <DataModel>[];
      json['data'].forEach((v) {
        dataModel!.add(DataModel.fromJson(v));
      });
    }
  }

}
