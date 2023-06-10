import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../../../utils/get/best_seller_api/best_seller_api.dart';
import '../../../../../../../utils/get/category_api/category_api.dart';
import '../../../../../../../utils/get/home_api/home_api/home_api.dart';
import '../../../../../../../utils/get/home_api/search_products_api/search_products_api.dart';
import '../../../../../../../utils/get/nearby_store_api/nearby_store_api.dart';
import '../../../../../../../utils/models/best_seller_model/best_seller_model.dart';
import '../../../../../../../utils/models/category_model/category_model.dart';
import '../../../../../../../utils/models/home_model/home_model.dart';
import '../../../../../../../utils/models/nearby_store_model/nearby_store_model.dart';
import '../../../../../../../utils/models/search_products_model/search_products_model.dart';

class HomeController extends GetxController {
  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;
  late Position currentPosition;
  late GoogleMapController mapController;
  Set<Marker> markers = <Marker>{};

  late TextEditingController searchController;
  List<SearchProductsModel> searchResults = [];

  HomeModel homeLayout = HomeModel();
  List<CategoryModel> categories = <CategoryModel>[];
  List<BestSellerModel> bestSeller = <BestSellerModel>[];
  List<NearByStoreModel> nearByStore = <NearByStoreModel>[];
  List<SearchProductsModel> searchProduct = <SearchProductsModel>[];

  HomeApiController homeApiController = HomeApiController();
  CategoryApiController categoryApiController = CategoryApiController();
  BestSellerApiController bestSellerController = BestSellerApiController();
  NearByApiController nearByApiController = NearByApiController();
  SearchProductApiController searchProductApiController = SearchProductApiController();



  @override
  void onInit() {
    getData();
    searchController = TextEditingController();
    searchController.addListener(() {
      search(searchController.text);
    });
    super.onInit();
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  @override
  void onClose() {
    searchController.clear();
    super.onClose();
  }

  Future<void> getData() async {
    loading.value = true;
    await determinePosition();
    categories = await categoryApiController.showCategory();
    bestSeller = await bestSellerController.showBestSelling();
    nearByStore = await nearByApiController.showNearByStore(latitude: currentPosition.latitude, longitude: currentPosition.longitude);
    searchProduct = await searchProductApiController.searchProducts();
    setMarker(currentPosition.latitude,currentPosition.longitude);
    // homeLayout = await homeApiController.showHomeLayout(latitude: 24.701508566702735, longitude: 46.681248712635586);
    homeLayout = await homeApiController.showHomeLayout(latitude: currentPosition.latitude, longitude: currentPosition.longitude);
    debugPrint('mmm G =>${nearByStore.length}');

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

  Future<void> setMarker(double latitude, double longitude) async {
    markers.add(
      Marker(
        markerId: const MarkerId('my_current_location'),
        visible: true,
        icon:  BitmapDescriptor.defaultMarker,
        position: LatLng(latitude, longitude),
        infoWindow: const InfoWindow(
          title: 'My Current Location',
        ),
      ),
    );
  }

  CameraPosition initialCameraPosition() {
    return CameraPosition(
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
      zoom: 15,
    );
  }

  void search(String query) async{
    if (query.isEmpty) {
      searchResults.clear();
    } else {
      searchResults = searchProduct
          .where((product) => product.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      update();
    }
    update();
  }

}
