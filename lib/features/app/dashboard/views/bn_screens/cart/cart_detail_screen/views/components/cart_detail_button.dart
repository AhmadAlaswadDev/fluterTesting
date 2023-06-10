part of cart_detail_view;

class CartDetailButton extends StatefulWidget {
  CartDetailButton({Key? key, required this.totalPrice}) : super(key: key);

  String totalPrice;

  @override
  State<CartDetailButton> createState() => _CartDetailButtonState();
}

class _CartDetailButtonState extends State<CartDetailButton> {

  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () async{
        if(controller.createOrderModel.result == true){
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              // CheckoutScreen(id: 1, totalPrice: widget.totalPrice,),
              WebViewCheckoutScreen(combinedOrderId: controller.createOrderModel.combinedOrderId!),
            ),
          );
        }

      },
      title: context.localizations.keep,
      titleColor: ColorResource.white,
      fontSize: 18.sp,
      widthButton: double.infinity,
      heightButton: 50.h,
      radius: 10.r,
      backgroundColor: ColorResource.primary,
      assetName: '',
    );
  }
}

