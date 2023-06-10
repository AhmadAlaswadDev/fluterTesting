part of cart_detail_view;

class ImageComponent extends StatefulWidget {
   ImageComponent({Key? key,required this.logo}) : super(key: key);
String logo;
  @override
  State<ImageComponent> createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
          color: ColorResource.lightGray,
          borderRadius: BorderRadius.circular(15.r),
          image:  DecorationImage(
            image: NetworkImage(widget.logo),
          )),
    );
  }
}
