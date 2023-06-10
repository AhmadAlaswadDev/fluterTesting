import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../utils/get/shop_category_api/shop_category_api.dart';
import '../../../../utils/models/shop_category_model/shop_category_model.dart';

class CategoryController extends GetxController {
  // CategoryController({required this.categoryId});

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;
  late Position currentPosition;
  late int categoryId;

  ShopCategoryModel shopCategoryModel = ShopCategoryModel();

  ShopCategoryApiController shopCategoryApiController =
      ShopCategoryApiController();

  void setId(int newId) {
    categoryId = newId;
    update();
  }

  @override
  void onInit() {
    // getData();
    super.onInit();
  }

  @override
  onClose() {
    // getData();
    super.onClose();
  }

  Future<void> getData(int categoryId) async {
    update();
    loading.value = true;
    await determinePosition();
    // shopCategoryModel = await shopCategoryApiController.showShopCategory(categoryId, latitude: 24.701508566702735, longitude: 46.681248712635586);
    shopCategoryModel = await shopCategoryApiController.showShopCategory(categoryId, latitude: currentPosition.latitude, longitude: currentPosition.longitude);
    debugPrint('mmm G =>${shopCategoryModel}');
    loading.value = false;
  }

  Future<void> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      debugPrint("Location in disable");
      permission = await Geolocator.requestPermission();
      return gitCurrentLocation();
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        debugPrint("Location in denied");
        permission = await Geolocator.requestPermission();
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      debugPrint("Location in denied forever");
      await Geolocator.openAppSettings();
      return;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      debugPrint("Location in whileInUse or always");
      return gitCurrentLocation();
    }

    await gitCurrentLocation();
  }

  Future<void> gitCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    debugPrint('mmm P =>$position');
    currentPosition = position;
  }



}
