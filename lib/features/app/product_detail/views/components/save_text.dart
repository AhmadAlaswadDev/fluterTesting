part of product_detail_view;

class SaveText extends StatefulWidget {
  const SaveText({Key? key, required this.saving, required this.discount, required this.hasDiscount}) : super(key: key);
  final String saving;
  final String discount;
  final bool hasDiscount;

  @override
  State<SaveText> createState() => _SaveTextState();
}

class _SaveTextState extends State<SaveText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorResource.green.withOpacity(0.2),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.r),
            topRight: Radius.circular(0.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 18.w),
            child: TextApp(
                text: "${context.localizations.youSaved} : ${widget.saving}",
                color: ColorResource.green,
                fontSize: 24.sp,
                fontWeight: FontWeight.w400),
          ),
          widget.hasDiscount == true ? Container(
            height: 60.h,
            width: 90.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorResource.primary,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5.r),
                  topRight: Radius.circular(0.r)),
            ),
            child: TextApp(
                text: "${widget.discount} off",
                color: ColorResource.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}