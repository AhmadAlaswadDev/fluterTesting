part of product_detail_view;

class NearByStoreComponent extends StatefulWidget {
  const NearByStoreComponent({
    Key? key,
    required this.imageStore, required this.nameStore, required this.shoppingCategories, required this.statusStore, required this.locationStore, required this.distanceStore, required this.upDiscount,
  }) : super(key: key);

  final String imageStore;
  final String nameStore;
  final String shoppingCategories;
  final String statusStore;
  final String locationStore;
  final String upDiscount;
  final String distanceStore;

  @override
  State<NearByStoreComponent> createState() => _NearByStoreComponentState();
}

class _NearByStoreComponentState extends State<NearByStoreComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorResource.lightGray,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: ColorResource.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Image.network(
              widget.imageStore,
              // ImagesApp.lc,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: widget.nameStore,
                // text: 'LC WaIKIKI',
                color: ColorResource.secondary,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                maxLine: 1,
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 5.h),
              TextApp(
                text: widget.shoppingCategories,
                // text: 'Shopping & retail',
                color: ColorResource.gray,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                maxLine: 1,
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 5.h),
              TextApp(
                text:  widget.locationStore,
                // text: 'Riyad, Asuwaidi,Al Asuwaidi Al Aam',
                color: ColorResource.secondary,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                maxLine: 1,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextApp(
                text: widget.statusStore,
                color: ColorResource.green,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                maxLine: 1,
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 7.h),
              TextApp(
                text: widget.upDiscount,
                color: ColorResource.red,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                maxLine: 1,
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 7.h),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,color: ColorResource.gray,size: 20.w),
                  TextApp(
                    text: widget.distanceStore,
                    // text: '2.9 KM',
                    color: ColorResource.secondary,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    maxLine: 1,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
