part of store_view;

class NearByStoreComponent extends StatefulWidget {
  const NearByStoreComponent(
      {Key? key,
      required this.id,
      required this.title,
      required this.image,
      required this.distance,
      required this.location})
      : super(key: key);

  final int id;
  final String title;
  final String image;
  final String location;
  final String distance;

  @override
  State<NearByStoreComponent> createState() => _NearByStoreComponentState();
}

class _NearByStoreComponentState extends State<NearByStoreComponent> {

  ShopDetailController shopDetailController = Get.put(ShopDetailController());

  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          width: 94.w,
          height: 102.h,
          decoration: BoxDecoration(
            color: ColorResource.gray,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Image.network(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
        TextApp(
          text: widget.title,
          color: ColorResource.secondary,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400,
          fontSize: 18.sp,
          maxLine: 1,
          overflow: TextOverflow.fade,
        ),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined,color: ColorResource.gray,size: 20.w),
            TextApp(
              text:  widget.location,
              color: ColorResource.secondary,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              maxLine: 1,
              overflow: TextOverflow.fade,
            ),
            SizedBox(width: 5.w),
            TextApp(
              text: widget.distance,
              color: ColorResource.secondary,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              maxLine: 1,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
        SizedBox(height: 7.h),
        InkWell(
          onTap: (){
            setState(() {
              _isFollowing = !_isFollowing;
            });
            if (_isFollowing) {
              shopDetailController.shopFollow(shopDetailController.shopDetailModel.id!);
            } else {
              shopDetailController.shopUnFollow(shopDetailController.shopDetailModel.id!);
            }
          },
          child: Container(
            width: 70.w,
            height: 23.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isFollowing ? ColorResource.primary : ColorResource.white,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: ColorResource.primary,
                width: 1,
              ),
            ),
            child: TextApp(
              text: _isFollowing ? context.localizations.following : context.localizations.follow,
              color: _isFollowing ? ColorResource.white :ColorResource.primary,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              maxLine: 1,
            ),
          ),
        ),
      ],
    );
  }
}
