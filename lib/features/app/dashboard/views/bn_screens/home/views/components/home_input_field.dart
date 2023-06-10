part of home_view;


class HomeInputField extends StatefulWidget {
  const HomeInputField({Key? key}) : super(key: key);

  @override
  State<HomeInputField> createState() => _HomeInputField();
}

class _HomeInputField extends State<HomeInputField> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                Get.to(SearchScreen());
              },
              child: Container(
                height: 50.h,
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: ColorResource.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  border: Border.all(color: ColorResource.gray,width: 1.5.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(text: context.localizations.search,color: ColorResource.gray),
                    const Icon(Icons.clear,color: ColorResource.gray),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 25.w),
          InkWell(
              onTap: () {
                Get.to(() => MapScreen());
              },
              child: SVGPicture(assetName: IconsApp.location, height: 19.h, width: 16.w, color: ColorResource.primary),),
          SizedBox(width: 17.w),
          InkWell(
              onTap: () {
                Get.bottomSheet(const BottomSheet(),
                    enterBottomSheetDuration: const Duration(milliseconds: 500),
                    exitBottomSheetDuration: const Duration(milliseconds: 400));
              },
              child: SVGPicture(assetName: IconsApp.filter, height: 22.h, width: 22.w, color: ColorResource.secondary),),
        ],
      ),
    );
  }

}



