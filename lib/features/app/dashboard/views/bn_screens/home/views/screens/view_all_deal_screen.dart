part of home_view;

class ViewAllDealScreen extends GetView<HomeController> {
  ViewAllDealScreen(this.title, {Key? key}) : super(key: key);
  String title;

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        centerTitle: true,
        title: TextApp(
            text: context.localizations.viewAll,
            color: ColorResource.secondary),
      ),
      body: title == context.localizations.bestDeals
          ? GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.homeLayout.bestSellers!.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 16.h, // Spacing between columns
                crossAxisSpacing: 16.w, // Spacing between rows
                childAspectRatio: 140.h / 160.w,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          controller.homeLayout.bestSellers![index].id!,
                          isFavorite: controller
                              .homeLayout.bestSellers![index].isFavorite!,
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
                          controller
                              .homeLayout.bestSellers![index].thumbnailImage!,
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
                                controller.homeLayout.bestSellers![index]
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
                                              '${controller.homeLayout.bestSellers![index].discount!} off',
                                          // text: '50% off',
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
                                                      .homeLayout
                                                      .bestSellers![index]
                                                      .isFavorite!
                                              ? Icon(
                                                  Icons.favorite,
                                                  size: 15.w,
                                                  color: controller
                                                          .homeLayout
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
                                                          .homeLayout
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
                            // SizedBox(height: 119.h),
                            const Spacer(flex: 5),
                            Flexible(
                              child: TextApp(
                                text: controller
                                    .homeLayout.bestSellers![index].name!,
                                // text: 'Hand bag',
                                color: ColorResource.secondary,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                maxLine: 1,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            TextApp(
                              text: controller
                                  .homeLayout.bestSellers![index].shop!.name!,
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
                                      text: controller.homeLayout
                                          .bestSellers![index].mainPrice!,
                                      // text: '\$50 SR',
                                      color: ColorResource.secondary,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                      maxLine: 1,
                                      overflow: TextOverflow.fade,
                                    ),
                                    SizedBox(width: 3.w),
                                    controller.homeLayout.bestSellers![index]
                                                .hasDiscount ==
                                            true
                                        ? TextApp(
                                            text: controller
                                                .homeLayout
                                                .bestSellers![index]
                                                .strokedPrice!,
                                            // text: '\$100 SR',
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
            )
          : GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.homeLayout.categories!.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                mainAxisSpacing: 0.w, // Spacing between rows
                crossAxisSpacing: 0.h, // Spacing between columns
                childAspectRatio: 78.h / 70.w,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(
                          id: controller.homeLayout.categories![index].id!,
                          title: controller.homeLayout.categories![index].name!,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35.r,
                        backgroundColor: ColorResource.warring,
                        backgroundImage: NetworkImage(controller
                            .homeLayout.categories![index].image
                            .toString()),
                      ),
                      SizedBox(height: 5.h),
                      TextApp(
                        text: controller.homeLayout.categories![index].name!,
                        // text: 'Beauty',
                        color: ColorResource.secondary,
                        fontSize: 14.sp,
                        maxLine: 2,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
