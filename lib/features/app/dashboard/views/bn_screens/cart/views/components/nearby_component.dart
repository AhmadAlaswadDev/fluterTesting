part of cart_view;

class NearByStoreComponent extends GetView<CartController> {
  NearByStoreComponent({Key? key}) : super(key: key);

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.isTrue) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.dataModel.isNotEmpty) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.dataModel.length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Number of columns
            mainAxisSpacing: 16.w, // Spacing between rows
            childAspectRatio: 339.w / 184.h, // Width on Height
          ),
          itemBuilder: (context, index) {
            return Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: ColorResource.lightGray,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: 94.w,
                        height: 101.h,
                        decoration: BoxDecoration(
                          color: ColorResource.gray,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Image.network(
                          controller.dataModel[index].logo.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp(
                              text: controller.dataModel[index].name!,
                              color: ColorResource.secondary,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(height: 5.h),
                            TextApp(
                              text: 'Shopping & retail',
                              color: ColorResource.gray,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(height: 5.h),
                            TextApp(
                              text:  controller.dataModel[index].address!,
                              // text: 'Riyad, Asuwaidi,Al Asuwaidi Al Aam',
                              color: ColorResource.secondary,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              maxLine: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextApp(
                            text: 'Open',
                            color: ColorResource.green,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            maxLine: 1,
                            overflow: TextOverflow.fade,
                          ),
                          SizedBox(height: 7.h),
                          TextApp(
                            text: controller.dataModel[index].saved!,
                            // text: '2.9 KM',
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
                  SizedBox(height: 8.h),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.dataModel[index].cartItemsModel!.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, productIndex) {
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.only(start: 5.w, end: 5.w),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CardDetailScreen(
                                    yourSaved:controller.dataModel[index].saved!,
                                    logo: controller.dataModel[index].logo!,
                                    name: controller.dataModel[index].name!,
                                    discounts: controller.dataModel[index].cartItemsModel![productIndex].discount!,
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(controller
                                  .dataModel[index].cartItemsModel![productIndex].productThumbnailImage!),
                              backgroundColor: Colors.white,
                              minRadius: 20.r,
                              maxRadius: 30.r,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        return const Text('no data');
      }
    });
  }
}
