library cart_detail_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/cart/controller/carts_controller.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../../../../../utils/extensions/color_resource.dart';
import '../../../../../../../../../widgets/text_app.dart';
import '../../../../../../../../../widgets/app_elevated_button.dart';
import '../../../../../../../checkout/screens/checkout_screen.dart';
import '../../../../../../../checkout/screens/webview_checkout_screen.dart';

part '../components/cart_component.dart';

part '../components/image_component.dart';

part '../components/header_text.dart';

part '../components/quantity_component.dart';

part '../components/item_text.dart';

part '../components/cart_detail_button.dart';

class CardDetailScreen extends StatefulWidget {
  CardDetailScreen(
      {Key? key,
      required this.logo,
      required this.name,
      required this.discounts,
      required this.yourSaved})
      : super(key: key);

  String logo;
  String name;
  String discounts;
  String yourSaved;

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {

  CartController controller = Get.put(CartController());

  int quantity = 1;
  double? itemPrice;
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          centerTitle: true,
          title: TextApp(
              text: context.localizations.cart, color: ColorResource.secondary),
        ),
        body: Obx(() {
          return controller.loading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ImageComponent(
                            logo: widget.logo,
                          ),
                          SizedBox(width: 10.w),
                          HeaderText(name: widget.name),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.cartItemModel.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            itemPrice = controller.cartItemModel[index].price!.toDouble();

                            return CartComponent(
                              onPressedRemove: () {
                                controller.removeItemCart(controller.cartItemModel[index].id!);
                                debugPrint('${controller.cartItemModel[index].id!}');
                              },
                              discount: controller.cartItemModel[index].discount!,
                              // price: controller.cartItemModel[index].price!,
                              price: itemPrice!,
                              name: controller.cartItemModel[index].productName!,
                              image: controller.cartItemModel[index].productThumbnailImage!,
                              quantity: controller.cartItemModel[index].quantity!,
                              lowerLimit: controller.cartItemModel[index].lowerLimit!,
                              upperLimit: controller.cartItemModel[index].upperLimit!,
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  ////////TO calculate price & quantity
                                  controller.cartItemModel[index].quantity = newQuantity;
                                  itemPrice = controller.cartItemModel[index].price!.toDouble() * newQuantity;

                                  ////////TO calculate summary account
                                  String yourSavedString = widget.yourSaved;
                                  String cleanedString = yourSavedString.replaceAll("ر.س", "");

                                  String numericString = cleanedString.replaceAll(RegExp(r'[^\d.]'), '');
                                  double yourSaving = double.tryParse(numericString) ?? 0.0;

                                  total = itemPrice! + (double.parse(widget.discounts.replaceAll('%', '')) / 100) + yourSaving;
                                  debugPrint("mmm$total");


                                });
                              },
                            );
                            //
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Column(
                        children: [
                          ItemText(
                            item: context.localizations.itemPrice,
                            price: itemPrice.toString(),
                          ),
                          SizedBox(height: 10.h),
                          ItemText(
                            item: context.localizations.discount,
                            price: widget.discounts,
                          ),
                          SizedBox(height: 10.h),
                          ItemText(
                            item: context.localizations.youSaved,
                            price: widget.yourSaved,
                          ),
                          SizedBox(height: 10.h),
                          Divider(
                              height: 3.h,
                              color: ColorResource.black,
                              thickness: 3),
                          ItemText(
                            item: context.localizations.total,
                            price: total.toString(),
                          ),
                          SizedBox(height: 20.h),
                          CartDetailButton(totalPrice: total.toString()),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ],
                  ),
                );
        }));
  }
}
