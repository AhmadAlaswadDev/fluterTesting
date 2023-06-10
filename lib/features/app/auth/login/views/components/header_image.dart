part of login_view;


class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        ImagesApp.logoApp,
        alignment: Alignment.center,
      ),
    );
  }
}
