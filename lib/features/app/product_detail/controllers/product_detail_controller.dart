// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../utils/get/home_api/product_detail_api/product_detail_api.dart';
// import '../../../../utils/models/product_detail_model/product_detail_model.dart';
//
// class ProductDetailController extends GetxController{
//
//   RxBool loading = true.obs;
//   RxBool isFavorite = false.obs;
//
//
//
//   ProductDetailModel? productDetail = ProductDetailModel();
//
//   ProductDetailApiController productDetailController = ProductDetailApiController();
//
//   @override
//   void onInit() {
//     getProductDetail(26);
//     super.onInit();
//   }
//
//   Future<void> getProductDetail(int id) async {
//     loading.value = true;
//     // productDetail = await productDetailController.showProductDetail(id);
//     debugPrint('mmm PD Con =>${productDetail}');
//     loading.value = false;
//     update();
//   }
//
// }