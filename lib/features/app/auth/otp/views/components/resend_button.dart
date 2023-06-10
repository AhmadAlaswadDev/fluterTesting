part of otp_view;

class _ResendButton extends StatelessWidget {
  const _ResendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
    title: context.localizations.resend,
    titleColor: ColorResource.white,
    fontSize: 15.sp,
    widthButton: double.infinity,
    heightButton: 50.h,
    radius: 5.r,
    backgroundColor: ColorResource.secondary,
    assetName: "",
    onPressed: (){},
    );
  }
}


