library favorite_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/product_detail/views/screens/product_detail_screen.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/extensions/icons_app.dart';

import '../../../../../../../../utils/extensions/images_app.dart';
import '../../../../../../../../widgets/custom_Input_field_icon.dart';
import '../../../../../../../../widgets/svg_picture.dart';
import '../../../../../../../../widgets/text_app.dart';
import '../../../../../../store//views/screens/store_screen.dart';
import '../../controller/favorite_controller.dart';

part '../components/product_component.dart';
part '../components/store_component.dart';
part '../components/deal_component.dart';
part '../components/input_field.dart';
part '../components/no_favorite_data.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        body: Padding(
          padding: EdgeInsets.only(top: 37.h, bottom: 10.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InputField(),
                SizedBox(height: 15.h),
                TabBar(
                  // isScrollable: true,
                  padding: EdgeInsets.only(bottom: 10.h),
                  controller: _tabController,
                  onTap: (value) {
                    // _tabController = value as TabController;
                  },
                  indicatorColor: ColorResource.secondary,
                  indicatorWeight: 5.w,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const ShapeDecoration(
                    shape: UnderlineInputBorder(),

                  ),
                  // indicator: const BoxDecoration(
                  //   gradient: LinearGradient(
                  //     colors: [Color(0xFF10C7E0), Color(0xFF00D5C3)],
                  //   ),
                  // ),
                  labelColor: ColorResource.secondary,
                  unselectedLabelColor: ColorResource.gray,
                  labelStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),

                  tabs: [
                    Tab(
                      text: context.localizations.products,
                    ),
                    Tab(
                      text: context.localizations.stores,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                      controller: _tabController,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ProductsComponent(),
                        StoresComponent(),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
