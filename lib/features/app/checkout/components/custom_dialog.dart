part of checkout_view;

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.r,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      title: SVGPicture(
          assetName: IconsApp.illustration, height: 180.h, width: 274.w),
      content: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextApp(
                text: 'Order Successful',
                color: ColorResource.secondary,
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center),
            TextApp(
                text: 'Your Order is Successful',
                color: ColorResource.secondary,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center),
            SizedBox(height: 24.h),
            AppElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Get.off(DashboardScreen());
              },
              title: 'keep shopping',
              assetName: '',
              titleColor: ColorResource.white,
              fontSize: 18.sp,
              widthButton: 156.w,
              heightButton: 50.h,
              radius: 5.r,
              backgroundColor: ColorResource.secondary,
            ),
            SizedBox(height: 15.h),
            AppElevatedButton(
              onPressed: () {
                Get.off(TrackMyOrderScreen());
              },
              title: 'Track My Order',
              assetName: '',
              titleColor: ColorResource.secondary,
              fontSize: 18.sp,
              widthButton: 164.w,
              heightButton: 50.h,
              radius: 5.r,
              backgroundColor: ColorResource.lightGray,
            ),
          ],
        ),
      ),
    );
  }
}
