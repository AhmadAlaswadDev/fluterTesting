part of favorite_view;

class ProductsComponent extends GetView<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.isTrue) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.productFavorite.isNotEmpty) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.productFavorite.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Number of columns
            mainAxisSpacing: 16.w, // Spacing between rows
            childAspectRatio: 339.w / 184.h, // Width on Height
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: ColorResource.red,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Image.network(
                          controller.productFavorite[index].logo.toString(),
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
                            text: controller.productFavorite[index].name!,
                            // text: 'LC WaIKIKI',
                            color: ColorResource.secondary,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            maxLine: 1,
                            overflow: TextOverflow.fade,
                          ),
                          // SizedBox(height: 5.h),
                          // TextApp(
                          //   text: controller.productFavorite[index].address!,
                          //   // text: 'Riyad, Asuwaidi,Al Asuwaidi Al Aam',
                          //   color: ColorResource.secondary,
                          //   textAlign: TextAlign.start,
                          //   fontWeight: FontWeight.w400,
                          //   fontSize: 12.sp,
                          //   maxLine: 1,
                          //   overflow: TextOverflow.fade,
                          // ),
                        ],
                      ),
                      // const Spacer(),
                      // Column(
                      //   children: [
                      //     TextApp(
                      //       text: controller.productFavorite[index].distance.toString(),
                      //       // text: '2.9 KM',
                      //       color: ColorResource.secondary,
                      //       textAlign: TextAlign.start,
                      //       fontWeight: FontWeight.w400,
                      //       fontSize: 12.sp,
                      //       maxLine: 1,
                      //       overflow: TextOverflow.fade,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        controller.productFavorite[index].products!.length,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // Number of columns
                      mainAxisSpacing: 21.w, // Spacing between rows
                      childAspectRatio: 141.h / 155.w, // Width on Height
                    ),
                    itemBuilder: (context, productIndex) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                controller.productFavorite[index]
                                    .products![productIndex].id!,
                                isFavorite: controller.productFavorite[index]
                                    .products![productIndex].isFavorite!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: ColorResource.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Stack(
                            children: [
                              Image.network(
                                controller.productFavorite[index]
                                    .products![productIndex].thumbnailImage!,
                                // ImagesApp.tShirt,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 62.w,
                                        height: 19.h,
                                        decoration: BoxDecoration(
                                          color: ColorResource.primary,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.r),
                                              topRight: Radius.circular(0.r),
                                              bottomLeft: Radius.circular(0.r),
                                              bottomRight:
                                                  Radius.circular(5.r)),
                                        ),
                                        child: TextApp(
                                          text:
                                              '${controller.productFavorite[index].products![productIndex].discount!} off',
                                          color: ColorResource.white,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          maxLine: 1,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 3.h),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: CircleAvatar(
                                            radius: 15.r,
                                            backgroundColor:
                                                ColorResource.lightGray,
                                            child: IconButton(
                                              onPressed: () {
                                                controller
                                                    .removeProductFavorite(
                                                        controller
                                                            .productFavorite[
                                                                index]
                                                            .products![
                                                                productIndex]
                                                            .id!);
                                              },
                                              icon: Icon(Icons.favorite,
                                                  size: 15.w,
                                                  color: ColorResource.primary),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(flex: 3),
                                  TextApp(
                                    text: controller.productFavorite[index]
                                        .products![productIndex].name!,
                                    color: ColorResource.secondary,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    maxLine: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(height: 5.h),
                                  TextApp(
                                    text:
                                        controller.productFavorite[index].name!,
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
                                            text: controller
                                                .productFavorite[index]
                                                .products![productIndex]
                                                .mainPrice!,
                                            color: ColorResource.secondary,
                                            textAlign: TextAlign.start,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            maxLine: 1,
                                            overflow: TextOverflow.fade,
                                          ),
                                          SizedBox(width: 3.w),
                                          TextApp(
                                            text: controller
                                                .productFavorite[index]
                                                .products![productIndex]
                                                .strokedPrice!,
                                            color: ColorResource.darkGray,
                                            textAlign: TextAlign.start,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10.sp,
                                            maxLine: 1,
                                            overflow: TextOverflow.fade,
                                            textDecoration:
                                                TextDecoration.lineThrough,
                                            decorationThickness: 3,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 60.w,
                                        height: 20.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: ColorResource.green
                                              .withOpacity(0.7),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.r)),
                                        ),
                                        child: TextApp(
                                          text: controller
                                              .productFavorite[index].saved
                                              .toString(),
                                          // text: 'Saving 50 SR',
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
                  ),
                ),
              ],
            );
          },
        );
      } else {
        return const NoFavoriteData();
      }
    });
  }
}
