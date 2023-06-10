import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zaheed/utils/get/page_api/page_api.dart';
import 'package:zaheed/utils/models/page_model/product_page_model.dart';
import 'package:zaheed/utils/models/page_model/shop_page_model.dart';

import '../../../../utils/get/shop_detail_api/shop_detail_api.dart';
import '../../../../utils/get/shop_detail_api/shop_follow_api.dart';
import '../../../../utils/models/shop_detail_model/shop_detail_model.dart';

class ShopDetailController extends GetxController {

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;
  RxBool isSelected = false.obs;
  late GoogleMapController mapController;
  Set<Marker> markers = <Marker>{};

  static ShopDetailController get to => Get.find<ShopDetailController>();

  ShopDetailModel shopDetailModel = ShopDetailModel();

  List<ShopPageModel> shopPageModel = <ShopPageModel>[];
  List<ProductPageModel> productPageModel = <ProductPageModel>[];

  ShopDetailApiController shopDetailApiController = ShopDetailApiController();

  ShopFollowApiController shopFollowApiController = ShopFollowApiController();

  PageApiController pageApiController = PageApiController();

  @override
  void onInit() {
    // getData();
    super.onInit();
  }


  Future<void> getData(int idShop, [int? pageId]) async {
    loading.value = true;
    shopDetailModel = await shopDetailApiController.showShopCategory(idShop);
    shopPageModel = await pageApiController.showShopPages(idShop);
    if (pageId != null) {
      productPageModel = await pageApiController.showProductPages(idShop, pageId);
    }

    // debugPrint('mmm G =>$shopDetailModel');
    await setMarker(double.parse(shopDetailModel.latitude!),double.parse(shopDetailModel.longitude!),shopDetailModel.id.toString(),shopDetailModel.name!);
    loading.value = false;
  }

  Future<void> setMarker(double latitude, double longitude,String id ,String shopName) async {
    markers.add(
      Marker(
        markerId: MarkerId(id),
        visible: true,
        icon:  BitmapDescriptor.defaultMarker,
        position: LatLng(latitude, longitude),
        infoWindow: const InfoWindow(
          title: '',
          // title: shopName,
        ),
      ),
    );
  }

  CameraPosition initialCameraPosition(double latitude, double longitude) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 18,
    );
  }

  Future<bool> shopFollow(int shopId) async{
    bool shopFollow = await shopFollowApiController.shopFollow(shopId: shopId);
    return shopFollow;
  }

  Future<bool> shopUnFollow(int shopId) async{
    bool shopUnFollow = await shopFollowApiController.shopUnFollow(shopId: shopId);
    return shopUnFollow;
  }


}
