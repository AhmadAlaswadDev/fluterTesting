part of home_view;


class StoresComponent extends StatefulWidget {
  const StoresComponent({Key? key}) : super(key: key);

  @override
  State<StoresComponent> createState() => _StoresComponentState();
}

class _StoresComponentState extends State<StoresComponent> {

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: homeController.searchProduct.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // Number of columns
        mainAxisSpacing: 16.w, // Spacing between rows
        childAspectRatio: 339.w / 101.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    StoreScreen(id: homeController.searchProduct[index].id!),
              ),
            );
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            decoration: BoxDecoration(
              color: ColorResource.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 94.w,
                  height: 101.h,
                  decoration: BoxDecoration(
                    color: ColorResource.red,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Image.network(
                    homeController.searchProduct[index].thumbnailImage!,
                    // ImagesApp.lc,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 7.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp(
                      text: homeController.searchProduct[index].name!,
                      color: ColorResource.secondary,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                      maxLine: 1,
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextApp(
                          text: 'Shopping & retail',
                          color: ColorResource.gray,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          maxLine: 1,
                          overflow: TextOverflow.fade,
                        ),
                        SizedBox(width: 119.w),
                        TextApp(
                          text: 'Open',
                          color: ColorResource.green,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          maxLine: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextApp(
                          text: 'Riyad, Asuwaidi,Al Asuwaidi Al Aam',
                          color: ColorResource.secondary,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          maxLine: 1,
                          overflow: TextOverflow.fade,
                        ),
                        SizedBox(width: 17.w),
                        TextApp(
                          text: '2.9 KM',
                          color: ColorResource.secondary,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          maxLine: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget vbuild(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      scrollDirection: Axis.vertical,
      itemCount: homeController.searchProduct.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 15,
          onTap: () {
            Get.to(ProductDetailScreen(homeController.searchProduct[index].id!,
              isFavorite: false,
            ));
          },
          leading: Container(
            clipBehavior: Clip.antiAlias,
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: ColorResource.red,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Image.network(
              homeController.searchProduct[index].thumbnailImage!,
              // ImagesApp.lc,
              fit: BoxFit.cover,
            ),
          ),
          title: TextApp(
            text: homeController.searchProduct[index].name!,
            color: ColorResource.secondary,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
            maxLine: 1,
            overflow: TextOverflow.fade,
          ),
          // trailing: IconButton(
          //   onPressed: (){},
          //   icon: const Icon(Icons.clear,color: ColorResource.lightGray),),
        );
      },
    );
  }
}


