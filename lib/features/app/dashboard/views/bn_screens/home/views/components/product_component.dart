part of home_view;

class ProductsComponent extends StatefulWidget {
  const ProductsComponent({Key? key}) : super(key: key);

  @override
  State<ProductsComponent> createState() => _ProductsComponentState();
}

class _ProductsComponentState extends State<ProductsComponent> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      scrollDirection: Axis.vertical,
      itemCount: homeController.searchResults.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 16.w, // Spacing between rows
        crossAxisSpacing: 16.h, // Spacing between columns
        childAspectRatio: 145.w / 193.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(
                ProductDetailScreen(homeController.searchResults[index].id!, isFavorite: false,));
            homeController.searchController.clear();
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: ColorResource.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  homeController.searchResults[index].thumbnailImage!,
                  // ImagesApp.cream,
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        homeController.searchResults[index].hasDiscount == true
                            ? Container(
                                width: 63.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: ColorResource.primary,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.r),
                                      topRight: Radius.circular(0.r),
                                      bottomLeft: Radius.circular(0.r),
                                      bottomRight: Radius.circular(5.r)),
                                ),
                                child: TextApp(
                                  text:
                                      '${homeController.searchResults[index].discount!} off',
                                  // text: '50% off',
                                  color: ColorResource.white,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  maxLine: 1,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            : const SizedBox(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                          child: Container(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 15.r,
                              backgroundColor: ColorResource.lightGray,
                              child: Obx(() {
                                return IconButton(
                                  onPressed: () {
                                    homeController.isFavorite.value =
                                        !homeController.isFavorite.value;
                                  },
                                  icon: homeController.isFavorite.isTrue
                                      ? Icon(
                                          Icons.favorite,
                                          size: 15.w,
                                          color:
                                              homeController.isFavorite.isTrue
                                                  ? ColorResource.primary
                                                  : ColorResource.secondary,
                                        )
                                      : Icon(
                                          Icons.favorite_border_outlined,
                                          size: 15.w,
                                          color:
                                              homeController.isFavorite.isTrue
                                                  ? ColorResource.primary
                                                  : ColorResource.secondary,
                                        ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 119.h),
                    const Spacer(flex: 6),
                    Flexible(
                      child: TextApp(
                        text: homeController.searchResults[index].name!,
                        // text: 'Hand bag',
                        color: ColorResource.secondary,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        maxLine: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextApp(
                      text: 'Alsalmanoptics',
                      color: ColorResource.darkBlue,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      maxLine: 1,
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextApp(
                              text: homeController.bestSeller[index].mainPrice!,
                              // text: '\$50 SR',
                              color: ColorResource.secondary,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(width: 1.w),
                            homeController.searchResults[index].hasDiscount ==
                                    true
                                ? TextApp(
                                    text: homeController
                                        .searchResults[index].strokedPrice!,
                                    // text: '\$100 SR',
                                    color: ColorResource.darkGray,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    maxLine: 1,
                                    overflow: TextOverflow.fade,
                                    textDecoration: TextDecoration.lineThrough,
                                    decorationThickness: 3,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 60.w,
                          height: 20.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorResource.green.withOpacity(0.7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: TextApp(
                            text: 'Saving 50 SR',
                            color: ColorResource.white,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                            fontSize: 9.5.sp,
                            maxLine: 1,
                            // overflow: TextOverflow.fade,
                          ),
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

}
