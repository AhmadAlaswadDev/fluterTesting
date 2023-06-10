part of home_view;


class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImagesApp.logoAppMain,
            alignment: Alignment.topLeft,
          ),
          SavingComponent(save: SharedPrefController().saved),
        ],
      ),
    );
  }
}
