part of product_detail_view;

class DetailText extends StatefulWidget {
  const DetailText({Key? key, required this.description}) : super(key: key);
  final String description;

  @override
  State<DetailText> createState() => _DetailTextState();
}

class _DetailTextState extends State<DetailText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w,top: 14.h),
      child: TextApp(
          text: widget.description,
          color: ColorResource.black,
          fontSize: 14.sp,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400),
    );
  }
}
