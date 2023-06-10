part of otp_view;

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextApp(
      text: context.localizations.verificationCode,
      color: ColorResource.black,
      fontSize: 26.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
