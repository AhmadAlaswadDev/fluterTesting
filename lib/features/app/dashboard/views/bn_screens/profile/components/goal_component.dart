part of profile_view;


class GoalComponent extends StatefulWidget {
  const GoalComponent({Key? key, required this.icon, required this.title, required this.number, required this.onPressed}) : super(key: key);

  final String icon;
  final String title;
  final String number;
  final void Function() onPressed;

  @override
  State<GoalComponent> createState() => _GoalContainerState();
}

class _GoalContainerState extends State<GoalComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70.h,
            width: 165.w,
            decoration: BoxDecoration(
              color: ColorResource.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: ColorResource.gray.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 9,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: 12.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SVGPicture(assetName: widget.icon),
                  SizedBox(width: 6.w),
                  TextApp(
                    text: widget.title,
                    fontSize: 14.sp,
                    color: ColorResource.black,
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 10.r,
                      backgroundColor: ColorResource.lightGray,
                      child: TextApp(
                        text: widget.number,
                        fontSize: 12.sp,
                        color: ColorResource.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
