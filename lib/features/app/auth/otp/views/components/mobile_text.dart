part of otp_view;

class _MobileText extends StatelessWidget {
  const _MobileText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextApp(
          text: '+972 592659279',
          color: ColorResource.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(width: 5.w),
        TextApp(
          text: context.localizations.phoneEnter,
          color: ColorResource.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
