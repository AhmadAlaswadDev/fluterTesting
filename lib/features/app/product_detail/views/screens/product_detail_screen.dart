library product_detail_view;

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/cart/controller/carts_controller.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/favorite/controller/favorite_controller.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/models/product_detail_model/product_detail_model.dart';
import 'package:zaheed/widgets/no_data.dart';

import '../../../../../../../../widgets/text_app.dart';
import '../../../../../utils/extensions/icons_app.dart';
import '../../../../../utils/get/product_detail_api/product_detail_api.dart';
import '../../../../../widgets/app_elevated_button.dart';
import '../../../dashboard/views/bn_screens/cart/views/screens/cart_screen.dart';

part '../components/swiper_component.dart';

part '../components/save_text.dart';

part '../components/title_text.dart';

part '../components/detail_text.dart';

part '../components/color_component.dart';

part '../components/size_component.dart';

part '../components/quantity_component.dart';

part '../components/nearby_component.dart';

part '../components/add_button.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen(this.id, {super.key, required this.isFavorite});

  final int id;
  final bool isFavorite;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  FavoriteController favoriteController = Get.put(FavoriteController());
  bool _isFavorite = false;

  late Future<List<ProductDetailModel?>> _future;

  Future<void> getProductDetail() async {
    _future = ProductDetailApiController().showProductDetail(widget.id);
    debugPrint('mmm screen=> ${widget.id}');
  }

  @override
  void initState() {
    getProductDetail();
    super.initState();
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
            CircleAvatar(
              radius: 15.r,
              backgroundColor: ColorResource.lightGray,
              child: IconButton(
                onPressed: () async{
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                  if (widget.isFavorite == false && _isFavorite) {
                    await favoriteController.addProductFavorite(widget.id);
                  } else {
                    await favoriteController.removeShopFavorite(widget.id);
                  }
                },
                icon: widget.isFavorite || _isFavorite
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
        body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwiperComponent(id: widget.id),
                    SaveText(
                        saving: '500',
                        hasDiscount: snapshot.data!.first!.hasDiscount!,
                        discount: snapshot.data!.first!.discount.toString()),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          TitleText(
                              title: snapshot.data!.first!.name.toString()),
                          DetailText(description: snapshot.data!.first!.description.toString()),
                          // if(snapshot.data!.first!.colors != null)
                          const TitleText(title: 'Product Color'),
                          // if(snapshot.data!.first!.colors != null)
                          ColorComponent(
                            colors: const [
                              Colors.red,
                              Colors.green,
                              Colors.blue,
                              Colors.yellowAccent,
                            ],
                            onColorSelected: (color) {
                              debugPrint('mmm=> Selected color: $color');
                            },
                          ),
                          const TitleText(title: 'Size'),
                          SizeComponent(
                            onSizeSelected: (String) {},
                          ),
                          const TitleText(title: 'Quantity'),
                          QuantityComponent(
                            onQuantitySelected: (quantity) {},
                          ),
                          NearByStoreComponent(
                            imageStore: snapshot.data!.first!.shopLogo!,
                            nameStore: snapshot.data!.first!.shopName!,
                            shoppingCategories: 'Shopping & retail',
                            locationStore: 'Riyad, Asuwaidi,Al Asuwaidi Al Aam',
                            statusStore: 'Open',
                            upDiscount: 'up to 50%',
                            distanceStore: '10.5',
                          ),
                        ],
                      ),
                    ),
                    AddButton(
                        id: widget.id,
                        quantity: 1,
                        mainPrice: snapshot.data!.first!.strokedPrice!,
                        discountPrice: snapshot.data!.first!.mainPrice!),
                  ]);
            } else {
              return const NoData();
            }
          },
        ),
      ),
    );
  }
}
