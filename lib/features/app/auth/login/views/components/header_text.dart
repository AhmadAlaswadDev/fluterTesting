part of login_view;

class HeaderText extends StatefulWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: context.localizations.welcome,
          color: ColorResource.black,
          fontSize: 26.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        TextApp(
          text: context.localizations.signInContinue,
          color: ColorResource.black,
          fontSize: 26.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}


