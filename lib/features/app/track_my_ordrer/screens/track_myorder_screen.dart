library track_myorder_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';

import '../../../../../../../../widgets/text_app.dart';
import '../../../../widgets/app_elevated_button.dart';

part '../components/order_status_component.dart';
part '../components/title_text.dart';
part '../components/view_button.dart';


class TrackMyOrderScreen extends StatefulWidget {
  const TrackMyOrderScreen({Key? key}) : super(key: key);

  @override
  State<TrackMyOrderScreen> createState() => _TrackMyOrderScreenState();
}

class _TrackMyOrderScreenState extends State<TrackMyOrderScreen> {

  int _currentStep = 0;

  List<Step> _buildOrderStatusSteps() {
    return [
      Step(
        title: TitleText(title: 'Order Placed', fontSize: 16.sp,),
        subtitle: TitleText(title: '10:00 AM', fontSize: 14.sp,),
        content: TitleText(title: 'Your order has been received and is being prepared for shipment.', fontSize: 14.sp,),
        isActive: _currentStep >= 0,
        state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: TitleText(title: 'Order Pending', fontSize: 16.sp,),
        subtitle: TitleText(title: '10:00 AM', fontSize: 14.sp,),
        content: TitleText(title: 'We are currently processing your order and it is awaiting shipment.', fontSize: 14.sp,),
        isActive: _currentStep >= 1,
        state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: TitleText(title: 'Confirmed', fontSize: 16.sp,),
        subtitle: TitleText(title: '10:00 AM', fontSize: 14.sp,),
        content: TitleText(title: 'Your order has been confirmed and is now being processed for shipment.', fontSize: 14.sp,),
        isActive: _currentStep >= 2,
        state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: TitleText(title: 'Processing', fontSize: 16.sp,),
        subtitle: TitleText(title: '10:00 AM', fontSize: 14.sp,),
        content: TitleText(title: 'Your order is currently being prepared for shipment and is in the final stages of processing.', fontSize: 14.sp,),
        isActive: _currentStep >= 3,
        state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: TitleText(title: 'Delivered', fontSize: 16.sp,),
        subtitle: TitleText(title: '10:00 AM', fontSize: 14.sp,),
        content: TitleText(title: 'Your order has been successfully delivered to the specified address.', fontSize: 14.sp,),
        isActive: _currentStep >= 4,
        state: _currentStep >= 4 ? StepState.complete : StepState.disabled,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: TextApp(text: 'Track MyOrder', color: ColorResource.secondary),
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BuildOrderStatusCard(
                steps: _buildOrderStatusSteps(),
                currentStep: _currentStep,
                onStepContinue: () {
                  setState(() {
                    if (_currentStep < _buildOrderStatusSteps().length - 1) {
                      _currentStep += 1;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (_currentStep > 0) {
                      _currentStep -= 1;
                    }
                  });
                },
              ),
              SizedBox(height: 40.h),
              const MapViewButton(),
            ],
          ),
        ),
      ),
    );
  }
}
