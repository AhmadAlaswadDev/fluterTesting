part of store_view;

class WorkBottomSheet extends StatefulWidget {
  const WorkBottomSheet({Key? key, required this.title, required this.body}) : super(key: key);

  final String title;
  final String body;

  @override
  State<WorkBottomSheet> createState() => _WorkBottomSheetState();
}

class _WorkBottomSheetState extends State<WorkBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(0.r),
            bottomRight: Radius.circular(0.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: widget.title,
                color: ColorResource.secondary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: ColorResource.lightGray,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      size: 14.w,
                      color:  ColorResource.secondary,
                    ),
                  ),
                ),
              )
            ],
          ),
          TextApp(
            text: widget.body,
            color: ColorResource.secondary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
