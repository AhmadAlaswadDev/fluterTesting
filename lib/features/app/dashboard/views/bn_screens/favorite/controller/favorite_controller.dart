import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaheed/utils/get/favorite_api/add_favorite_api.dart';

import '../../../../../../../utils/get/favorite_api/product_favorite_api.dart';
import '../../../../../../../utils/get/favorite_api/remove_favorite_api.dart';
import '../../../../../../../utils/get/favorite_api/shop_favorite_api.dart';
import '../../../../../../../utils/models/favorite_model/product_favorite_model.dart';
import '../../../../../../../utils/models/favorite_model/shop_favorite_model.dart';

class FavoriteController extends GetxController {

  RxBool loading = true.obs;

  static FavoriteController get to => Get.find<FavoriteController>();

  List<ShopsFavoriteModel> shopFavorite = <ShopsFavoriteModel>[];

  ShopFavoriteApiController shopFavoriteApiController = ShopFavoriteApiController();

  RemoveFavoriteApiController removeFavoriteApiController = RemoveFavoriteApiController();

  AddFavoriteApiController addFavoriteApiController = AddFavoriteApiController();

  List<ProductFavoriteModel> productFavorite = <ProductFavoriteModel>[];

  ProductFavoriteApiController productFavoriteApiController = ProductFavoriteApiController();

  @override
  void onInit() {
    getFavoriteData();
    super.onInit();
  }

  Future<void> getFavoriteData() async {
    loading.value = true;
    shopFavorite = await shopFavoriteApiController.showShopFavorite();
    productFavorite = await productFavoriteApiController.showProductFavorite();
    debugPrint('mmm productFavoriteController =>${productFavorite.length}');
    debugPrint('mmm shopFavoriteController =>${shopFavorite.length}');
    loading.value = false;
  }

  Future<bool> removeShopFavorite(int shopId) async{
   bool removeShopFavorite = await removeFavoriteApiController.removeShopFavorite(shopId: shopId);
   if(removeShopFavorite){
     int index = shopFavorite.indexWhere((element) => element.shop!.id == shopId);
     if(index != -1){
       shopFavorite.removeAt(index);
       update();
     }
   }
   return removeShopFavorite;

  }

  Future<bool> addShopFavorite(int shopId) async{
    update();
    bool addShopFavorite = await addFavoriteApiController.addShopFavorite(shopId: shopId);
    update();
    return addShopFavorite;
  }

  Future<bool> removeProductFavorite(int productId) async{
    bool removeProductFavorite = await removeFavoriteApiController.removeProductFavorite(productId: productId);
    if(removeProductFavorite){
      int index = productFavorite.indexWhere((element) => element.products!.first.id == productId);
      if(index != -1){
        productFavorite.removeAt(index);
        getFavoriteData();
        update();
      }

    }
    return removeProductFavorite;
  }

  Future<bool> addProductFavorite(int productId) async{
    bool addShopFavorite = await addFavoriteApiController.addProductFavorite(productId: productId);
    update();
    return addShopFavorite;
  }


}