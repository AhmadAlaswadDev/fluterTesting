library home_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/extensions/icons_app.dart';

import '../../../../../../../../prefs/shared_pref_controller.dart';
import '../../../../../../../../utils/extensions/images_app.dart';
import '../../../../../../../../widgets/custom_Input_field_icon.dart';
import '../../../../../../../../widgets/no_data.dart';
import '../../../../../../../../widgets/svg_picture.dart';
import '../../../../../../../../widgets/text_app.dart';
import '../../../../../../category/view/screens/category_screen.dart';
import '../../../../../../product_detail/views/screens/product_detail_screen.dart';
import '../../../../../../store//views/screens/store_screen.dart';
import '../../controllers/home_controller.dart';


part '../components/header_image.dart';
part '../components/input_field.dart';
part '../components/categories_text.dart';
part '../components/categories_component.dart';
part '../components/deal_text.dart';
part '../components/deal_component.dart';
part '../components/nearby_text.dart';
part '../components/nearby_component.dart';
part '../components/bottom_sheet.dart';
part '../components/home_input_field.dart';
part '../components/search_input_field.dart';
part '../components/product_component.dart';
part '../components/store_component.dart';
part '../components/saving_component.dart';
part '../screens/search_screen.dart';
part '../screens/map_screen.dart';
part '../screens/view_all_deal_screen.dart';


class HomeScreen extends GetView<HomeController> {

  final HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() {
            return controller.loading.isTrue ? const Center(
              child: CircularProgressIndicator(),
            ) : SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderImage(),
                    SizedBox(height: 14.h),
                    const HomeInputField(),
                    SizedBox(height: 11.h),
                    const CategoriesText(),
                    SizedBox(height: 11.h),
                    CategoriesComponent(),
                    SizedBox(height: 15.h),
                    const DealText(),
                    SizedBox(height: 11.h),
                    DealsComponent(),
                    SizedBox(height: 15.h),
                    const NearByStoreText(),
                    SizedBox(height: 11.h),
                    NearByStoreComponent(),
                  ]),
            );
          }
        ),
      ),
    );
  }
}
