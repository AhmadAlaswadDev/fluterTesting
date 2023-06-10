part of product_detail_view;

class TitleText extends StatefulWidget {
  const TitleText({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w,top: 14.h),
      child: TextApp(
          text: widget.title,
          color: ColorResource.black,
          fontSize: 18.sp,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400),
    );
  }
}

