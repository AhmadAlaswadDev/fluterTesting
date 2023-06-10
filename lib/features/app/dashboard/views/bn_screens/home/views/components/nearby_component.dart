part of home_view;

class NearByStoreComponent extends GetView<HomeController> {
  NearByStoreComponent({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      // width: double.infinity,
      child: controller.homeLayout.nearby!.isEmpty
          ? const NoData()
          : GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // itemCount: 10,
              itemCount: controller.homeLayout.nearby!.length,
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
                        builder: (context) => StoreScreen(
                          id: controller.homeLayout.nearby![index].id!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
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
                          height: 102.h,
                          decoration: BoxDecoration(
                            color: ColorResource.gray,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Image.network(
                            controller.homeLayout.nearby![index].logo!,
                            // ImagesApp.lc,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp(
                              text: controller.homeLayout.nearby![index].name!,
                              // text: 'LC WaIKIKI',
                              color: ColorResource.secondary,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(height: 5.h),
                            TextApp(
                              text: controller.homeLayout.nearby![index].shopCategory!,
                              // text: 'Shopping & retail',
                              color: ColorResource.gray,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(height: 5.h),
                            TextApp(
                              text:  controller.homeLayout.nearby![index].address!,
                              // text: 'Riyad, Asuwaidi,Al Asuwaidi Al Aam',
                              color: ColorResource.secondary,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                        const Spacer(),
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
                              text: 'Up to 50%',
                              color: ColorResource.red,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(height: 7.h),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,color: ColorResource.gray,size: 20.w),
                                TextApp(
                                  text: controller.homeLayout.nearby![index].distance
                                      .toString(),
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
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
