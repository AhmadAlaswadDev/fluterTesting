part of myorder_view;


class OngoingComponent extends GetView<MyOrdersController> {


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.isTrue) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.myOrder.isNotEmpty) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.myOrder.length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Number of columns
            mainAxisSpacing: 16.h, // Spacing between rows
            childAspectRatio: 343.w / 145.h, // Width on Height
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: ColorResource.lightGray,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: 'LC WaIKIKI',
                    color: ColorResource.secondary,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    maxLine: 1,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextApp(
                        text: context.localizations.orderID,
                        color: ColorResource.secondary,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        maxLine: 1,
                      ),
                      TextApp(
                        text: controller.myOrder[index].id.toString(),
                        color: ColorResource.secondary,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        maxLine: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextApp(
                        text: context.localizations.status,
                        color: ColorResource.secondary,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        maxLine: 1,
                      ),
                      TextApp(
                        text: controller.myOrder[index].orderStatus!,
                        color: ColorResource.green,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        maxLine: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextApp(
                        text: context.localizations.youSaved,
                        color: ColorResource.green,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        maxLine: 1,
                      ),
                      TextApp(
                        text: controller.myOrder[index].totalSaving!,
                        color: ColorResource.green,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        maxLine: 1,
                      ),
                    ],
                  ),
                  Divider(height: 10.h,color: ColorResource.black,thickness: 1),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const TrackMyOrderScreen(),
                        ),
                      );
                    },
                    child: TextApp(
                      text: context.localizations.trackMyOrder,
                      color: ColorResource.primary,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      maxLine: 1,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        return TextApp(text: 'No Order Here!');
      }
      }
    );
  }
}