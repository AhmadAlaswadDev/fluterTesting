library myorder_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/my_ordrer/controller/my_order_controller.dart';
import 'package:zaheed/features/app/track_my_ordrer/screens/track_myorder_screen.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';

import '../../../../../../../../widgets/text_app.dart';

part '../components/ongoing_component.dart';
part '../components/complete_component.dart';


class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  MyOrdersController myOrdersController = Get.put(MyOrdersController());

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
        appBar: AppBar(
          centerTitle: true,
          title: TextApp(text: context.localizations.myOrder, color: ColorResource.secondary),
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  shape: UnderlineInputBorder(),),
                labelColor: ColorResource.secondary,
                unselectedLabelColor: ColorResource.gray,
                labelStyle:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                unselectedLabelStyle:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),

                tabs: [
                  Tab(
                    text: context.localizations.ongoing,
                  ),
                  Tab(
                    text: context.localizations.complete,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      OngoingComponent(),
                      CompleteComponent(),
                    ]),
              ),
            ]),
      ),
    );
  }
}
