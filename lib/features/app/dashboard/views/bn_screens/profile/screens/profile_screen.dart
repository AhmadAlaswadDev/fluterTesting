library profile_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/features/app/checkout/screens/checkout_screen.dart';
import 'package:zaheed/features/app/my_ordrer/views/screens/myorder_screen.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/extensions/icons_app.dart';

import '../../../../../../../../utils/extensions/images_app.dart';
import '../../../../../../../../widgets/svg_picture.dart';
import '../../../../../../../../widgets/text_app.dart';
import '../../../../../../../helpers/helpers.dart';
import '../../../../../../../prefs/shared_pref_controller.dart';
import '../../../../../addressbook/screens/addressbook_screen.dart';
import '../../../../../change_password/views/screens/change_password_screen.dart';
import '../../../../../notifcation/screens/notification_screen.dart';
import '../../../../../setting/views/screens/setting_screen.dart';

part '../components/header.dart';

part '../components/progress_text.dart';

part '../components/progress_component.dart';

part '../components/goal_component.dart';

part '../components/list_tile_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with Helpers{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Header(),
                const ProgressText(),
                const ProgressComponent(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoalComponent(
                        onPressed: () {},
                        icon: IconsApp.ticketStar,
                        title: context.localizations.rewardsGoals,
                        number: '2',
                      ),
                      GoalComponent(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyOrderScreen(),
                            ),
                          );
                        },
                        icon: IconsApp.cartOutLine,
                        title: context.localizations.myOrder,
                        number: '5',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoalComponent(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        },
                        icon: IconsApp.notification,
                        title: context.localizations.notification,
                        number: '8',
                      ),
                      GoalComponent(
                        onPressed: () {},
                        icon: IconsApp.wallet,
                        title: context.localizations.wallet,
                        number: '5',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                ListTileComponent(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(id: 2),
                        ),
                      );
                    },
                    icon: IconsApp.paymentMethods,
                    title: context.localizations.paymentMethods,
                    trailingIcon: Icons.arrow_forward_ios_rounded),
                // ListTileComponent(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const AddressBookScreen(),
                //         ),
                //       );
                //     },
                //     icon: IconsApp.location,
                //     title: context.localizations.addressBook,
                //     trailingIcon: Icons.arrow_forward_ios_rounded),
                // ListTileComponent(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const ChangePasswordScreen(),
                //         ),
                //       );
                //     },
                //     icon: IconsApp.lock,
                //     title: context.localizations.changePassword,
                //     trailingIcon: Icons.arrow_forward_ios_rounded),
                ListTileComponent(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingScreen(),
                        ),
                      );
                    },
                    icon: IconsApp.settings,
                    title: context.localizations.setting,
                    trailingIcon: Icons.arrow_forward_ios_rounded),
                ListTileComponent(
                  onPressed: () async{
                    await logOut(context);
                  },
                  icon: IconsApp.logout,
                  title: context.localizations.logout,
                ),
              ]),
        ),
      ),
    );
  }
}
