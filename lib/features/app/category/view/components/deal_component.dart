part of category_view;

class DealsComponent extends GetView<CategoryController> {
  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: controller.shopCategoryModel.bestSellers!.isEmpty
          ? const SizedBox()
          : GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.shopCategoryModel.bestSellers!.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                mainAxisSpacing: 16.w, // Spacing between rows
                childAspectRatio: 193.h / 160.w,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          controller.shopCategoryModel.bestSellers![index].id!,
                          isFavorite: controller.shopCategoryModel
                              .bestSellers![index].isFavorite!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: ColorResource.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network(
                          controller.shopCategoryModel.bestSellers![index]
                              .thumbnailImage!,
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
                                controller.shopCategoryModel.bestSellers![index]
                                            .hasDiscount ==
                                        true
                                    ? Container(
                                        width: 63.w,
                                        height: 20.h,
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
                                              '${controller.shopCategoryModel.bestSellers![index].discount} off',
                                          color: ColorResource.white,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          maxLine: 1,
                                        ),
                                      )
                                    : const SizedBox(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 3.h),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: CircleAvatar(
                                      radius: 15.r,
                                      backgroundColor: ColorResource.lightGray,
                                      child: Obx(() {
                                        return IconButton(
                                          onPressed: () {
                                            // controller.isFavorite.value =
                                            //     !controller.isFavorite.value;
                                          },
                                          icon: controller.isFavorite.isTrue ||
                                                  controller
                                                      .shopCategoryModel
                                                      .bestSellers![index]
                                                      .isFavorite!
                                              ? Icon(
                                                  Icons.favorite,
                                                  size: 15.w,
                                                  color: controller
                                                          .shopCategoryModel
                                                          .bestSellers![index]
                                                          .isFavorite!
                                                      ? ColorResource.primary
                                                      : ColorResource.secondary,
                                                )
                                              : Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  size: 15.w,
                                                  color: controller
                                                          .shopCategoryModel
                                                          .bestSellers![index]
                                                          .isFavorite!
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
                            const Spacer(flex: 5),
                            Flexible(
                              child: TextApp(
                                text: controller.shopCategoryModel
                                    .bestSellers![index].name!,
                                color: ColorResource.secondary,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                maxLine: 1,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            TextApp(
                              text: controller.shopCategoryModel
                                  .bestSellers![index].shop!.name!,
                              color: ColorResource.darkBlue,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              maxLine: 1,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextApp(
                                  text: controller.shopCategoryModel
                                      .bestSellers![index].mainPrice!,
                                  color: ColorResource.secondary,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  maxLine: 1,
                                ),
                                SizedBox(width: 3.w),
                                controller.shopCategoryModel.bestSellers![index].hasDiscount == true
                                    ? TextApp(
                                  text: controller
                                      .shopCategoryModel
                                      .bestSellers![index]
                                      .strokedPrice!,
                                  color: ColorResource.darkGray,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp,
                                  maxLine: 1,
                                  textDecoration:
                                  TextDecoration.lineThrough,
                                  decorationThickness: 3,
                                )
                                    : const SizedBox(),
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
            ),
    );
  }
}
