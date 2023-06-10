part of cart_detail_view;

class CartComponent extends StatefulWidget {
  CartComponent(
      {Key? key,
      required this.name,
      required this.discount,
      required this.price,
      required this.image,
      required this.quantity,
      required this.lowerLimit,
      required this.upperLimit,
      required this.onQuantityChanged,
      required this.onPressedRemove,
      })
      : super(key: key);
  late String name;
  late String discount;
  late double price;
  late String image;
  late int quantity;
  late int lowerLimit;
  late int upperLimit;
  final Function(int) onQuantityChanged;
  final void Function() onPressedRemove;


  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {


  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: ColorResource.lightGray),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.image),
            minRadius: 20.r,
            maxRadius: 30.r,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: widget.name,
                color: ColorResource.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              TextApp(
                text: widget.discount,
                color: ColorResource.red,
                fontSize: 14.sp,
              ),
              TextApp(
                text: "${widget.price}",
                color: ColorResource.black,
                fontSize: 14.sp,
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 6.h),
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: ColorResource.gray,
                  child: IconButton(
                    onPressed: widget.onPressedRemove,
                    icon: Icon(
                      Icons.close_rounded,
                      size: 12.w,
                      color: ColorResource.secondary,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80.w,
                height: 20.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: ColorResource.green.withOpacity(0.2),
                ),
                child: TextApp(
                  text: "${context.localizations.youSaved} :",
                  fontSize: 10.sp,
                  color: ColorResource.green,
                ),
              ),
              QuantityComponent(quantity: widget.quantity, lowerLimit: widget.lowerLimit, upperLimit: widget.upperLimit, onQuantityChanged: widget.onQuantityChanged,),
            ],
          ),
        ],
      ),
    );
  }
}
