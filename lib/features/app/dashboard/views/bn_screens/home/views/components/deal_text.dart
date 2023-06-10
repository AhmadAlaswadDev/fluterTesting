part of home_view;

class DealText extends StatefulWidget {
  const DealText({Key? key}) : super(key: key);

  @override
  State<DealText> createState() => _DealTextState();
}

class _DealTextState extends State<DealText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            text: context.localizations.bestDeals,
            color: ColorResource.secondary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewAllDealScreen(context.localizations.bestDeals),
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
