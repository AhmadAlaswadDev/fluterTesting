part of product_detail_view;

class AddButton extends StatefulWidget {
  const AddButton({Key? key, required this.id, required this.quantity, required this.mainPrice, required this.discountPrice}) : super(key: key);

  final int id;
  final int quantity;
  final String mainPrice;
  final String discountPrice;

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {

  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    debugPrint('mmm cart screen 😍=> ${widget.id}');
    debugPrint('mmm cart screen 😍=> ${widget.quantity}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(text: context.localizations.price,fontSize: 14.sp,fontWeight: FontWeight.w600,color: ColorResource.black,),
              Row(
                children: [
                  TextApp(text: widget.discountPrice,fontSize: 14.sp,fontWeight: FontWeight.w600,color: ColorResource.secondary,),
                  SizedBox(width: 10.w,),
                  TextApp(text: widget.mainPrice,fontSize: 14.sp,fontWeight: FontWeight.w600,color: ColorResource.gray,textDecoration: TextDecoration.lineThrough,decorationThickness: 3),
                ],
              ),
            ],
          ),
          AppElevatedButton(
            onPressed: () async{
              await cartController.addItemCart(widget.id, widget.quantity);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //      CartScreen(id: widget.id),
              //   ),
              // );
            },
            title: context.localizations.addToCart,
            assetName: IconsApp.cartOutLine,
            titleColor: ColorResource.white,
            fontSize: 18.sp,
            widthButton: 156.w,
            heightButton: 50.h,
            radius: 5.r,
            backgroundColor: ColorResource.primary,
          ),
        ],
      ),
    );
  }
}
