part of store_view;

class TabComponent extends StatefulWidget {
  const TabComponent({Key? key, required this.title, required this.image, required this.onPressed}) : super(key: key);

  final String title;
  final String image;
  final void Function() onPressed;

  @override
  State<TabComponent> createState() => _TabComponentState();
}

class _TabComponentState extends State<TabComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Row(
        children: [
          SVGPicture(assetName: widget.image,height: 20.h, width: 20.w,),
          SizedBox(width: 8.w),
          TextApp(
            text: widget.title,
            color: ColorResource.black,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            maxLine: 1,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
