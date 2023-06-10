part of otp_view;

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesApp.logoApp,
      alignment: Alignment.center,
    );
  }
}
