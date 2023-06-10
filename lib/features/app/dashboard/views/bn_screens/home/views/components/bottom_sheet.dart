part of home_view;

class BottomSheet extends StatefulWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  int _selectedRadio = 0;
  bool isSelected = false;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 665.h,
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(0.r),
            bottomRight: Radius.circular(0.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: context.localizations.storeType,
                  color: ColorResource.secondary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: ColorResource.lightGray,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        size: 14.w,
                        color:  ColorResource.secondary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        height: 48.h,
                        width: 125.w,
                        margin: EdgeInsetsDirectional.only(end: 37.w),
                        decoration: BoxDecoration(
                          color: isSelected ? ColorResource.primary : ColorResource.lightGray,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: TextApp(
                            text: 'Market',
                            color: isSelected ? ColorResource.white : ColorResource.secondary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(
            height: 37.h,
            color: ColorResource.lightGray,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextApp(
              text: context.localizations.sortBy,
              color: ColorResource.secondary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: TextApp(
              text: context.localizations.mostWanted,
              color: ColorResource.secondary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
            horizontalTitleGap: 0,
            leading: Radio(
              value: 0,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChange,
              focusColor: ColorResource.gray,
              activeColor: ColorResource.primary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: TextApp(
              text: context.localizations.mostRecent,
              color: ColorResource.secondary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
            horizontalTitleGap: 0,
            leading: Radio(
              value: 1,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChange,
              focusColor: ColorResource.gray,
              activeColor: ColorResource.primary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: TextApp(
              text: context.localizations.highestPrice,
              color: ColorResource.secondary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
            horizontalTitleGap: 0,
            leading: Radio(
              value: 2,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChange,
              focusColor: ColorResource.gray,
              activeColor: ColorResource.primary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: TextApp(
              text: context.localizations.lowestPrice,
              color: ColorResource.secondary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
            horizontalTitleGap: 0,
            leading: Radio(
              value: 3,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChange,
              focusColor: ColorResource.gray,
              activeColor: ColorResource.primary,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: TextApp(
              text: context.localizations.nearbyStores,
              color: ColorResource.secondary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
            horizontalTitleGap: 0,
            leading: Radio(
              value: 4,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChange,
              focusColor: ColorResource.gray,
              activeColor: ColorResource.primary,
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
