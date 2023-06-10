library addressbook_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';

import '../../../../../../../../widgets/svg_picture.dart';
import '../../../../../../../../widgets/text_app.dart';
import '../../../../utils/extensions/icons_app.dart';
import '../../../../widgets/app_elevated_button.dart';

part '../components/title_text.dart';
part '../components/nearby_component.dart';
part '../components/add_address_button.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {

  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: TextApp(text: 'Address Book', color: ColorResource.secondary),
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleText(title: 'Address'),
                        SizedBox(height: 6.h),
                        const NearByStoreComponent(id: 1, title: 'Home Address', image: IconsApp.location, detail: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',),

                      ]);
                },
              ),
            ),
            AddAddressButton(),
          ],
        ),
      ),
    );
  }
}
