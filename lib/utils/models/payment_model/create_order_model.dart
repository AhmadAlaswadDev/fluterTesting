class CreateOrderModel {
  int? combinedOrderId;
  bool? result;
  String? message;

  CreateOrderModel({this.combinedOrderId, this.result, this.message});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    combinedOrderId = json['combined_order_id'];
    result = json['result'];
    message = json['message'];
  }

}
