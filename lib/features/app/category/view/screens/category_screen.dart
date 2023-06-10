library category_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/product_detail/views/screens/product_detail_screen.dart';
import 'package:zaheed/features/app/store/views/screens/store_screen.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/extensions/icons_app.dart';

import '../../../../../../../../widgets/svg_picture.dart';
import '../../../../../../../../widgets/text_app.dart';
import '../../../../../widgets/custom_Input_field_icon.dart';
import '../../controller/category_controller.dart';

part '../components/deal_text.dart';

part '../components/deal_component.dart';

part '../components/nearby_component.dart';

part '../components/input_field.dart';

part '../components/bottom_sheet.dart';
part '../components/categories_component.dart';
part '../components/categories_text.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.id, required this.title})
      : super(key: key);
  final int id;
  final String title;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    debugPrint('mmm screen 😍=> ${widget.id}');
    categoryController.getData(widget.id);
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
          centerTitle: true,
          title: TextApp(text: widget.title, color: ColorResource.secondary),
          actions: [
            InkWell(
              onTap: () {
                Get.bottomSheet(const BottomSheet(),
                    enterBottomSheetDuration: const Duration(milliseconds: 500),
                    exitBottomSheetDuration: const Duration(milliseconds: 400));
              },
              child: SVGPicture(
                  assetName: IconsApp.filter,
                  height: 22.h,
                  width: 22.w,
                  color: ColorResource.secondary),
            ),
            SizedBox(width: 16.w)
          ],
        ),
        body: Obx(() {
          return categoryController.loading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  // padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InputField(),
                        SizedBox(height: 15.h),
                        const CategoriesText(),
                        SizedBox(height: 11.h),
                        CategoriesComponent(),
                        const DealText(),
                        SizedBox(height: 11.h),
                        DealsComponent(),
                        SizedBox(height: 22.h),
                        NearByStoreComponent(),
                      ]),
                );
        }),
      ),
    );
  }
}
