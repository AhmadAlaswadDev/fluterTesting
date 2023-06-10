part of home_view;

class CategoriesText extends StatefulWidget {
  const CategoriesText({Key? key}) : super(key: key);

  @override
  State<CategoriesText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<CategoriesText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            text: context.localizations.storeCategories,
            color: ColorResource.secondary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewAllDealScreen(context.localizations.storeCategories),
                ),
              );
            },
            child: TextApp(
              text: context.localizations.viewAll,
              color: ColorResource.gray,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
