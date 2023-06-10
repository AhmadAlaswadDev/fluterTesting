import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaheed/utils/get/my_order_api_controller/my_order_api_controller.dart';
import 'package:zaheed/utils/models/my_order_model/my_order_model.dart';


class MyOrdersController extends GetxController {

  RxBool loading = true.obs;

  static MyOrdersController get to => Get.find<MyOrdersController>();

  List<MyOrderModel> myOrder = <MyOrderModel>[];

  MyOrderApiController myOrderApiController = MyOrderApiController();

  @override
  void onInit() {
    getMyOderData();
    super.onInit();
  }

  Future<void> getMyOderData() async {
    loading.value = true;
    myOrder = await myOrderApiController.showMyOrder();
    debugPrint('mmm myOrder =>${myOrder.length}');
    loading.value = false;
  }


}