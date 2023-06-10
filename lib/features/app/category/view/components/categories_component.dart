part of category_view;

class CategoriesComponent extends GetView<CategoryController> {
  CategoriesComponent({Key? key}) : super(key: key);

  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124.h,
      child: controller.shopCategoryModel.categories!.isEmpty
          ? const SizedBox()
          : GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.shopCategoryModel.categories!.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                mainAxisSpacing: 8.w, // Spacing between rows
                crossAxisSpacing: 6.h, // Spacing between columns
                childAspectRatio: 97.h / 70.w,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(
                          id: controller
                              .shopCategoryModel.categories![index].id!,
                          title: controller
                              .shopCategoryModel.categories![index].name!,
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
                            .shopCategoryModel.categories![index].image
                            .toString()),
                      ),
                      SizedBox(height: 5.h),
                      TextApp(
                        text: controller
                            .shopCategoryModel.categories![index].name!,
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
