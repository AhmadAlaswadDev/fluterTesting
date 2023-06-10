part of addressbook_view;

class NearByStoreComponent extends StatefulWidget {
  const NearByStoreComponent({Key? key, required this.id, required this.title, required this.image, required this.detail}) : super(key: key);

  final int id;
  final String title;
  final String image;
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
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        leading: Container(
          height: 35.h,
          width: 35.w,
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: ColorResource.lightGray,
            borderRadius: BorderRadius.circular(15.r),),
          child: SVGPicture(assetName: widget.image,color: ColorResource.black),
        ),
        title: TextApp(
          text: widget.title,
          color: ColorResource.secondary,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          maxLine: 1,
        ),
        subtitle: TextApp(
          text: widget.detail,
          color: ColorResource.secondary,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          maxLine: 2,
        ),
        trailing: InkWell(
          onTap: (){},
          child: SVGPicture(assetName: IconsApp.delete),
        ),
        horizontalTitleGap: 13.w,
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
        minVerticalPadding: 0,

      ),
    );
  }
}
