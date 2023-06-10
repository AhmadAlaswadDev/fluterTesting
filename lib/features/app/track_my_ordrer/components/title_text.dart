part of track_myorder_view;

class TitleText extends StatefulWidget {
  const TitleText({Key? key, required this.title, required this.fontSize}) : super(key: key);
  final String title;
  final double fontSize;

  @override
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return TextApp(
        text: widget.title,
        color: ColorResource.black,
        fontSize: widget.fontSize,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w400);
  }
}

