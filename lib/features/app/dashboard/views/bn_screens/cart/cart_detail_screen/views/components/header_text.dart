part of cart_detail_view;

class HeaderText extends StatefulWidget {
   HeaderText({Key? key,required this.name}) : super(key: key);
String name;
  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return TextApp(
      text: widget.name,
      color: ColorResource.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    );
  }
}
