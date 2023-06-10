part of profile_view;

class ListTileComponent extends StatefulWidget {
  ListTileComponent({Key? key, required this.icon, required this.title, this.trailingIcon ,required this.onPressed}) : super(key: key);

  final String icon;
  final String title;
  IconData? trailingIcon;
  final void Function() onPressed;

  @override
  State<ListTileComponent> createState() => _ListTileComponentState();
}

class _ListTileComponentState extends State<ListTileComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        horizontalTitleGap: 8.w,
        leading: CircleAvatar(
          radius: 20.r,
          backgroundColor: ColorResource.lightGray,
          child: SVGPicture(
            assetName: widget.icon,
            color: ColorResource.black,
            height: 24.h,
            width: 24.w,
          ),
        ),
        title: TextApp(
          text: widget.title,
          color: ColorResource.secondary,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.start,
        ),
        trailing: Icon(widget.trailingIcon,color: ColorResource.black),
      ),
    );
  }
}
