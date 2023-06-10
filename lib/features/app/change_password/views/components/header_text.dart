part of change_password_view;

class HeaderText extends StatefulWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return TextApp(
      text: 'Reset Password',
      color: ColorResource.black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
    );
  }
}


