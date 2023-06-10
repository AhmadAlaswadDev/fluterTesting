part of setting_view;

class ListTileComponent extends StatefulWidget {
  ListTileComponent({Key? key, required this.title, this.trailingIcon ,required this.onPressed}) : super(key: key);

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
        horizontalTitleGap: 0.w,
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
