part of store_view;

class DealsComponent extends StatefulWidget {
  const DealsComponent(
      {Key? key,
      required this.id,
      required this.image,
      required this.hasDiscount,
      required this.discount,
      required this.name,
      required this.shopName,
      required this.mainPrice,
      required this.strokedPrice,
      required this.saving,
      required this.isFavorite})
      : super(key: key);
  final int id;
  final String image;
  final bool hasDiscount;
  final String discount;
  final String name;
  final String shopName;
  final String mainPrice;
  final String strokedPrice;
  final String saving;
  final bool isFavorite;

  @override
  State<DealsComponent> createState() => _DealsComponentState();
}

class _DealsComponentState extends State<DealsComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              widget.id,
              isFavorite: widget.isFavorite,
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
              widget.image,
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
                    widget.hasDiscount == true
                        ? Container(
                            width: 63.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: ColorResource.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  topRight: Radius.circular(0.r),
                                  bottomLeft: Radius.circular(0.r),
                                  bottomRight: Radius.circular(5.r)),
                            ),
                            child: TextApp(
                              text: '${widget.discount} off',
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                      child: Container(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: ColorResource.lightGray,
                          child: IconButton(
                            onPressed: () {
                              // controller.isFavorite.value =
                              //     !controller.isFavorite.value;
                            },
                            icon: widget.isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    size: 15.w,
                                    color: ColorResource.primary,
                                  )
                                : Icon(
                                    Icons.favorite_border_outlined,
                                    size: 15.w,
                                    color: ColorResource.secondary,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 5),
                Flexible(
                  child: TextApp(
                    text: widget.name,
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
                  text: widget.shopName,
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
                      text: widget.mainPrice,
                      // text: '\$50 SR',
                      color: ColorResource.secondary,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      maxLine: 1,
                    ),
                    SizedBox(width: 2.w),
                    widget.hasDiscount == true
                        ? TextApp(
                            text: widget.strokedPrice,
                            // text: '\$100 SR',
                            color: ColorResource.darkGray,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            maxLine: 1,
                            textDecoration: TextDecoration.lineThrough,
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
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),
                      child: TextApp(
                        text: widget.saving,
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
  }
}
