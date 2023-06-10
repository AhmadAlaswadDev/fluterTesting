part of cart_detail_view;

class ItemText extends StatefulWidget {
  const ItemText({Key? key, required this.item, required this.price}) : super(key: key);

  final String item;
  final String price;

  @override
  State<ItemText> createState() => _ItemTextState();
}

class _ItemTextState extends State<ItemText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextApp(
          text: widget.item,
          fontSize: 18.sp,
          color: ColorResource.black,
        ),
        TextApp(
          text: widget.price,
          fontSize: 18.sp,
          color: ColorResource.black,
        ),
      ],
    );
  }
}
