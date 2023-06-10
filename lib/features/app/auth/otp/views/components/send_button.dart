part of otp_view;



class _SendButton extends StatefulWidget {
  const _SendButton({Key? key, required this.title, required this.onPressed,}) : super(key: key);

  final String title;
  final void Function() onPressed;


  @override
  State<_SendButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<_SendButton> {
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      title: widget.title,
      titleColor: ColorResource.white,
      fontSize: 15.sp,
      widthButton: double.infinity,
      heightButton: 50.h,
      radius: 5.r,
      backgroundColor: ColorResource.primary,
      onPressed: widget.onPressed,
      assetName: "",
    );
  }
}
