class MyOrderModel {
  int? id;
  String? code;
  int? userId;
  String? paymentType;
  String? paymentStatus;
  String? paymentStatusString;
  String? orderStatus;
  String? orderStatusString;
  int? combinedOrderId;
  String? grandTotal;
  String? totalSaving;
  String? date;

  MyOrderModel(
      {this.id,
        this.code,
        this.userId,
        this.paymentType,
        this.paymentStatus,
        this.paymentStatusString,
        this.orderStatus,
        this.orderStatusString,
        this.combinedOrderId,
        this.grandTotal,
        this.totalSaving,
        this.date,});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    userId = json['user_id'];
    paymentType = json['payment_type'];
    paymentStatus = json['payment_status'];
    paymentStatusString = json['payment_status_string'];
    orderStatus = json['order_status'];
    orderStatusString = json['order_status_string'];
    combinedOrderId = json['combined_order_id'];
    grandTotal = json['grand_total'];
    totalSaving = json['total_saving'];
    date = json['date'];
  }

}