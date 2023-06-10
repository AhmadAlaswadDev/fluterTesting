part of favorite_view;

class DealsComponent extends StatefulWidget {
  const DealsComponent({Key? key}) : super(key: key);

  @override
  State<DealsComponent> createState() => _DealsComponentState();
}

class _DealsComponentState extends State<DealsComponent> {
  late bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 10.h,
        maxHeight: 200.h,
        minWidth: double.infinity,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Number of columns
          mainAxisSpacing: 16.w, // Spacing between rows
          childAspectRatio: 193.h / 145.w,
        ),
        itemBuilder: (context, index) {
          return Container(
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
                Image.asset(
                  ImagesApp.cream,
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
                        Container(
                          width: 63.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: ColorResource.primary,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r), topRight: Radius.circular(0.r), bottomLeft: Radius.circular(0.r), bottomRight: Radius.circular(5.r)),
                          ),
                          child: TextApp(
                            text: '50% off',
                            color: ColorResource.white,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            maxLine: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                          child: Container(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 15.r,
                              backgroundColor: ColorResource.lightGray,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isFavorite
                                        ? _isFavorite = false
                                        : _isFavorite = true;
                                  });
                                },
                                icon: _isFavorite ? Icon(
                                  Icons.favorite,
                                  size: 15.w,
                                  color: _isFavorite
                                      ? ColorResource.primary
                                      : ColorResource.secondary,
                                ) : Icon(
                                  Icons.favorite_border_outlined,
                                  size: 15.w,
                                  color: _isFavorite
                                      ? ColorResource.primary
                                      : ColorResource.secondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 119.h),
                    const Spacer(flex: 5),
                    Flexible(
                      child: TextApp(
                        text: 'Hand bag',
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
                              text: '\$50 SR',
                              color: ColorResource.secondary,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(width: 3.w),
                            TextApp(
                              text: '\$100 SR',
                              color: ColorResource.darkGray,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              maxLine: 1,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 60.w,
                          height: 20.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorResource.green.withOpacity(0.7),
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
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
          );
        },
      ),
    );
  }
}
