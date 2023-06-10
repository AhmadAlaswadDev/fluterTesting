
class SummaryModel {
  String? subTotal;
  String? tax;
  String? shippingCost;
  String? discount;
  String? savingTotal;
  String? grandTotal;
  int? grandTotalValue;

  SummaryModel(
      {this.subTotal,
        this.tax,
        this.shippingCost,
        this.discount,
        this.savingTotal,
        this.grandTotal,
        this.grandTotalValue});

  SummaryModel.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    discount = json['discount'];
    savingTotal = json['saving_total'];
    grandTotal = json['grand_total'];
    grandTotalValue = json['grand_total_value'];
  }

}