library checkout_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/dashboard/views/dashboard_screen.dart';
import 'package:zaheed/features/app/track_my_ordrer/screens/track_myorder_screen.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/widgets/svg_picture.dart';

import '../../../../../../../../widgets/text_app.dart';
import '../../../../utils/extensions/icons_app.dart';
import '../../../../widgets/app_elevated_button.dart';
import '../../../../widgets/custom_Input_field_icon.dart';

part '../components/title_text.dart';
part '../components/price_text.dart';
part '../components/checkout_button.dart';
part '../components/checkout_card.dart';
part '../components/payment_method_selector.dart';
part '../components/input_field.dart';
part '../components/custom_dialog.dart';


class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key, required this.id, this.totalPrice}) : super(key: key);
  final int id;
  String? totalPrice;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          centerTitle: true,
          title: TextApp(text: context.localizations.paymentMethods, color: ColorResource.secondary),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: widget.id == 1,
                  child: Column(
                    children: [
                      TitleText(title: context.localizations.checkoutPrice),
                      // PriceText(price: widget.totalPrice!),
                      // SizedBox(height: 15.h),
                    ],
                  ),
                ),
                TitleText(title: context.localizations.paymentMethods),
                SizedBox(height: 10.h),
                const CheckoutCard(),
                SizedBox(height: 10.h),
                const InputField(),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: widget.id == 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleText(title: 'Delivery methods'),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle_outline_rounded))
                        ],
                      ),
                      Container(
                        height: 50.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorResource.lightGray,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SVGPicture(assetName: IconsApp.location),
                            Flexible(child: TextApp(text: 'Riyad, Asuwaidi,Al Asuwaidi Al Aam',fontSize: 16.sp,textAlign: TextAlign.start,color: ColorResource.secondary,)),
                            SVGPicture(assetName: IconsApp.delete,color: ColorResource.primary),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 27.h),
                CheckoutButton(id: widget.id),
              ]),
        ),
      ),
    );
  }
}
