part of register;

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesApp.logoApp,
      alignment: Alignment.center,
    );
  }
}
