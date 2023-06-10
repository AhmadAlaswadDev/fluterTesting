part of checkout_view;

class TitleText extends StatefulWidget {
  const TitleText({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return TextApp(
        text: widget.title,
        color: ColorResource.black,
        fontSize: 20.sp,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w400);
  }
}

