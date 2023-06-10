part of store_view;

class TabTextComponent extends StatefulWidget {
  const TabTextComponent({Key? key, required this.title, required this.onPressed, required this.isSelected}) : super(key: key);
  final String title;
  final bool isSelected;
  final void Function() onPressed;

  @override
  State<TabTextComponent> createState() => _TabTextComponentState();
}

class _TabTextComponentState extends State<TabTextComponent> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 50.h,
        width: 80.w,
        margin: EdgeInsetsDirectional.only(end: 18.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: widget.isSelected ? ColorResource.secondary : ColorResource.white,
              width: 2.0,
            ),
          ),
        ),

        child: Center(
          child: TextApp(
            text: widget.title,
            color: widget.isSelected ? ColorResource.secondary : ColorResource.gray,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
