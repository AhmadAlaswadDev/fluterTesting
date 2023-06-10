part of profile_view;

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorResource.lightGray,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: ColorResource.darkGray,
            backgroundImage: AssetImage(SharedPrefController().phone),
          ),
          TextApp(
            text: SharedPrefController().userName,
            // text: 'Mahmoud Alserhi',
            fontSize: 18.sp,
            color: ColorResource.black,
          ),
          SizedBox(height: 5.h),
          TextApp(
            text: SharedPrefController().phone,
            // text: '+972 592659279',
            fontSize: 14.sp,
            color: ColorResource.black,
          ),
        ],
      ),
    );
  }
}
