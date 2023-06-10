part of favorite_view;


class StoresComponent extends GetView<FavoriteController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
          builder: (controller) {
            if(controller.loading.isTrue){
              return const Center(child: CircularProgressIndicator());
            }else if(controller.shopFavorite.isNotEmpty){
              return GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.shopFavorite.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Number of columns
                  mainAxisSpacing: 16.w, // Spacing between rows
                  childAspectRatio: 339.w / 101.h, // Width on Height
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreScreen(id: controller.shopFavorite[index].shop!.id!),
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
                        alignment: Alignment.bottomCenter,
                        children: [
                          Row(
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
                                  controller.shopFavorite[index].shop!.logo!,
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
                                    text: controller.shopFavorite[index].shop!.name!,
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
                                    // text: controller.shopFavorite[index].shop!.shopCategory!,
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
                                    text:  controller.shopFavorite[index].shop!.address!,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 15.r,
                                    backgroundColor: ColorResource.lightGray,
                                    child: IconButton(
                                      onPressed: () {
                                        controller.removeShopFavorite(controller.shopFavorite[index].shop!.id!);
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 15.w,
                                        color: ColorResource.primary,
                                      ),
                                    ),
                                  ),
                                  TextApp(
                                    text: 'Open',
                                    color: ColorResource.green,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    maxLine: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(height: 5.h),
                                  TextApp(
                                    text: 'Up to 50%',
                                    color: ColorResource.red,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    maxLine: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,color: ColorResource.gray,size: 18.w),
                                      TextApp(
                                        text: controller.shopFavorite[index].shop!.distance
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
                        ],
                      ),
                    ),
                  );
                },
              );
            }else{
              return const NoFavoriteData();
            }

          }
        );
  }
}
