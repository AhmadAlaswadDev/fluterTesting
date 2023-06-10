part of checkout_view;

class PriceText extends StatefulWidget {
  const PriceText({Key? key, required this.price}) : super(key: key);
  final String price;

  @override
  State<PriceText> createState() => _PriceTextState();
}

class _PriceTextState extends State<PriceText> {
  @override
  Widget build(BuildContext context) {
    return TextApp(
        text: "${widget.price} SR",
        color: ColorResource.black,
        fontSize: 30.sp,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w400);
  }
}
