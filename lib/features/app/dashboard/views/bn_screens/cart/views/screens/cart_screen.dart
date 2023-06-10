library cart_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/cart/controller/carts_controller.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';

import '../../../../../../../../widgets/text_app.dart';
import '../../cart_detail_screen/views/screens/cart_detail_screen.dart';

part '../components/nearby_component.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: TextApp(
              text: context.localizations.cart, color: ColorResource.secondary),
        ),
        body: Obx(() {
          if (controller.loading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(controller.dataModel.isNotEmpty) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NearByStoreComponent(),
                  ]),
            );
          }else{
            return const Center(child: Text('no data'));
          }
        }),
      ),
    );
  }
}
