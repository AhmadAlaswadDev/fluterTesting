import 'package:get/get.dart';
import 'package:zaheed/utils/get/cart_api_controller/cart_api_controller.dart';
import 'package:zaheed/utils/get/payment_api/create_order_api.dart';
import 'package:zaheed/utils/models/cart_model/cart_item_model.dart';
import 'package:zaheed/utils/models/cart_model/data_model.dart';
import 'package:zaheed/utils/models/cart_model/summary_model.dart';
import 'package:zaheed/utils/models/payment_model/create_order_model.dart';


class CartController extends GetxController {

  static CartController get to => Get.find<CartController>();

  RxBool loading = true.obs;

  SummaryModel summaryModel = SummaryModel();
  List<DataModel> dataModel = <DataModel>[];
  List<CartItemsModel> cartItemModel = <CartItemsModel>[];
  CreateOrderModel createOrderModel = CreateOrderModel();
  CartApiController cartApiController = CartApiController();
  CreateOrderApiController createOrderApiController = CreateOrderApiController();




  @override
  void onInit() {
    getData();

    super.onInit();
  }


  @override
  void dispose() {

    super.dispose();
  }


  @override
  void onClose() {

    super.onClose();
  }

  Future<void> getData() async {
    loading.value = true;
    summaryModel = await cartApiController.showSummaryCart();
    dataModel = await cartApiController.showDataCart();
    cartItemModel = await cartApiController.showCartItem();

    loading.value = false;
  }


  Future<bool> addItemCart(int itemId, int quantity) async{
    update();
    bool addToCart = await cartApiController.addItem(itemId: itemId, quantity: quantity);
    update();
    return addToCart;
  }


  Future<bool> removeItemCart(int itemId) async{
    bool removeItemCart = await cartApiController.removeItem(itemId: itemId);
    if(removeItemCart){
      int index = cartItemModel.indexWhere((element) => element.id! == itemId);
      if(index != -1){
        cartItemModel.removeAt(index);
        getData();
        update();
      }

    }
    return removeItemCart;
  }

  Future<void> createOrder() async {
    loading.value = true;
    createOrderModel = await createOrderApiController.createOrder();
    loading.value = false;
  }



}
