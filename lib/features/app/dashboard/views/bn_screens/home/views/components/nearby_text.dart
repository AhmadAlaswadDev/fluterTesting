part of home_view;

class NearByStoreText extends StatefulWidget {
  const NearByStoreText({Key? key}) : super(key: key);

  @override
  State<NearByStoreText> createState() => _NearByStoreTextState();
}

class _NearByStoreTextState extends State<NearByStoreText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            text: context.localizations.nearbyStores,
            color: ColorResource.secondary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          InkWell(
            onTap: (){},
            child: TextApp(
              text: '',
              // text: context.localizations.viewAll,
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

