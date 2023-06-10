part of notification_view;

class NearByStoreComponent extends StatefulWidget {
  const NearByStoreComponent({Key? key, required this.title, required this.detail}) : super(key: key);

  final String title;
  final String detail;


  @override
  State<NearByStoreComponent> createState() => _NearByStoreComponentState();
}

class _NearByStoreComponentState extends State<NearByStoreComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: ColorResource.lightGray,
            spreadRadius: 5.r,
            blurRadius: 7.r,
            offset: const Offset(0, 5), // changes position of shadow
          ),
          BoxShadow(
            color: ColorResource.gray.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 9,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 35.h,
            width: 35.w,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: ColorResource.lightGray,
                borderRadius: BorderRadius.circular(15.r),),
            child: SVGPicture(assetName: IconsApp.notification),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: widget.title,
                  color: ColorResource.secondary,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  maxLine: 1,
                ),
                SizedBox(height: 5.h),
                Flexible(
                  child: TextApp(
                    text: widget.detail,
                    color: ColorResource.secondary,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    maxLine: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
