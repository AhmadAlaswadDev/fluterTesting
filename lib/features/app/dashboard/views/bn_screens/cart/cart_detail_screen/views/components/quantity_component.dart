part of cart_detail_view;

class QuantityComponent extends StatefulWidget {
  QuantityComponent({
    Key? key,
    required this.quantity,
    required this.lowerLimit,
    required this.upperLimit,
    required this.onQuantityChanged,
  }) : super(key: key);

  late int quantity;
  late int lowerLimit;
  late int upperLimit;
  final Function(int) onQuantityChanged;

  @override
  State<QuantityComponent> createState() => _QuantityComponentState();
}

class _QuantityComponentState extends State<QuantityComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (widget.quantity != 1 && widget.lowerLimit != 0) {
                widget.quantity--;
                widget.onQuantityChanged(widget.quantity);
              }
            });
          },
          child: Container(
            height: 25.h,
            width: 25.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: ColorResource.transparent,
              border: Border.all(
                color: ColorResource.black,
                width: 2,
              ),
            ),
            child: const Icon(Icons.remove_rounded, size: 22),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextApp(
            text: widget.quantity.toString(),
            color: ColorResource.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (widget.quantity == widget.upperLimit) {
                // Do nothing
              } else {
                widget.quantity++;
                widget.onQuantityChanged(widget.quantity);
              }
            });
          },
          child: Container(
            height: 25.h,
            width: 25.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: ColorResource.transparent,
              border: Border.all(
                color: ColorResource.black,
                width: 2,
              ),
            ),
            child: const Icon(Icons.add_rounded, size: 22),
          ),
        ),
      ],
    );
  }
}
