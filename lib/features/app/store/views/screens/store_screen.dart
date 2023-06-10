library store_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/favorite/controller/favorite_controller.dart';
import 'package:zaheed/features/app/product_detail/views/screens/product_detail_screen.dart';
import 'package:zaheed/features/app/store/controller/shop_detail_controller.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/extensions/icons_app.dart';
import 'package:zaheed/widgets/custom_Input_field_icon.dart';

import '../../../../../../../../widgets/svg_picture.dart';
import '../../../../../../../../widgets/text_app.dart';

part '../components/nearby_component.dart';

part '../components/tab_component.dart';

part '../components/input_field.dart';

part '../components/filter_bottom_sheet.dart';

part '../components/work_bottom_sheet.dart';

part '../components/deal_component.dart';

part '../components/saving_component.dart';

part '../components/tab_text_component.dart';

part '../screens/map_screen.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with SingleTickerProviderStateMixin {
  ShopDetailController shopDetailController = Get.put(ShopDetailController());
  FavoriteController favoriteController = Get.put(FavoriteController());

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    debugPrint('mmm screen 😍=> ${widget.id}');
    shopDetailController.getData(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          actions: [
            Center(
              child: TextApp(
                text: 'Open',
                color: ColorResource.green,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                maxLine: 1,
              ),
            ),
            SizedBox(width: 14.w),
            CircleAvatar(
              radius: 15.r,
              backgroundColor: ColorResource.lightGray,
              child: IconButton(
                onPressed: () async {
                  setState(() {
                    shopDetailController.isFavorite.value =
                        !shopDetailController.isFavorite.value;
                  });
                  if (shopDetailController.shopDetailModel.isFavorite! ||
                      shopDetailController.isFavorite.value == false) {
                    await favoriteController.addShopFavorite(
                        shopDetailController.shopDetailModel.id!);
                    shopDetailController.getData(widget.id);
                  } else {
                    await favoriteController.removeShopFavorite(
                        shopDetailController.shopDetailModel.id!);
                    shopDetailController.getData(widget.id);
                  }
                },
                icon: shopDetailController.isFavorite
                        .value /*|| shopDetailController.shopDetailModel.isFavorite!*/
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
            SizedBox(width: 16.w)
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 5.h),
          child: Obx(() {
            return shopDetailController.loading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        NearByStoreComponent(
                          id: shopDetailController.shopDetailModel.id!,
                          image: shopDetailController.shopDetailModel.logo!,
                          title: shopDetailController.shopDetailModel.name!,
                          location:
                              shopDetailController.shopDetailModel.address!,
                          distance: '2.9KM',
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            TabComponent(
                              title: context.localizations.workingHours,
                              image: IconsApp.timeSquare,
                              onPressed: () {
                                Get.bottomSheet(
                                    WorkBottomSheet(
                                      title: context.localizations.workingHours,
                                      body: shopDetailController
                                          .shopDetailModel.workingHours!,
                                    ),
                                    enterBottomSheetDuration:
                                        const Duration(milliseconds: 500),
                                    exitBottomSheetDuration:
                                        const Duration(milliseconds: 400));
                              },
                            ),
                            SizedBox(width: 10.w),
                            TabComponent(
                              title: context.localizations.returnPolicy,
                              image: IconsApp.wallet,
                              onPressed: () {
                                Get.bottomSheet(
                                    WorkBottomSheet(
                                      title: context.localizations.returnPolicy,
                                      body: shopDetailController
                                          .shopDetailModel.refundPolicy!,
                                    ),
                                    enterBottomSheetDuration:
                                        const Duration(milliseconds: 500),
                                    exitBottomSheetDuration:
                                        const Duration(milliseconds: 400));
                              },
                            ),
                            const Spacer(),
                            SavingComponent(
                                save: shopDetailController
                                    .shopDetailModel.saved!),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        InputField(shopName: shopDetailController.shopDetailModel.name!),
                        Row(
                          children: [
                            Expanded(
                                child: shopDetailController
                                        .shopPageModel.isEmpty
                                    ? const SizedBox()
                                    : SizedBox(
                                        height: 50.h,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: shopDetailController
                                                .shopPageModel.length,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return TabTextComponent(
                                                onPressed: () async {
                                                  shopDetailController
                                                          .isSelected.value =
                                                      !shopDetailController
                                                          .isSelected.value;
                                                  await shopDetailController
                                                      .getData(widget.id, shopDetailController.shopPageModel[index].id!);
                                                },
                                                title: shopDetailController
                                                    .shopPageModel[index].name!,
                                                isSelected: shopDetailController
                                                    .isSelected.value,
                                              );
                                            }),
                                      )),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Visibility(
                          visible: shopDetailController.isSelected.isFalse || shopDetailController.shopPageModel.isEmpty,
                            replacement: Expanded(
                              child: shopDetailController.productPageModel.isEmpty
                                  ? const SizedBox()
                                  : GridView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: shopDetailController
                                      .productPageModel.length,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // Number of columns
                                    mainAxisSpacing:
                                    15.w, // Spacing between rows
                                    crossAxisSpacing:
                                    15.h, // Spacing between columns
                                    childAspectRatio: 140.w / 193.h,
                                  ),
                                  itemBuilder: (context, index) {
                                    return DealsComponent(
                                      id: shopDetailController
                                          .productPageModel[index].id!,
                                      image: shopDetailController
                                          .productPageModel[index]
                                          .thumbnailImage!,
                                      hasDiscount: shopDetailController
                                          .productPageModel[index].hasDiscount!,
                                      discount: shopDetailController
                                          .productPageModel[index].discount!,
                                      name: shopDetailController
                                          .productPageModel[index].name!,
                                      shopName: shopDetailController
                                          .productPageModel[index].shop!.name!,
                                      mainPrice: shopDetailController
                                          .productPageModel[index].mainPrice!,
                                      strokedPrice: shopDetailController
                                          .productPageModel[index]
                                          .strokedPrice!,
                                      saving: 'SAR 00.0',
                                      isFavorite: shopDetailController
                                          .productPageModel[index].isFavorite!,
                                    );
                                  }),
                            ),
                            child: const SizedBox(),
                        ),

                      ]);
          }),
        ),
      ),
    );
  }
}
