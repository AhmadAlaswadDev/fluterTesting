part of register;

class HeaderText extends StatefulWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextApp(
          text: context.localizations.createYourAccount,
          color: ColorResource.black,
          fontSize: 26.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}


