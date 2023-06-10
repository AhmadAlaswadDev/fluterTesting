import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/cart/controller/carts_controller.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/cart/views/screens/cart_screen.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/home/controllers/home_controller.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/home/views/screens/home_screen.dart';
import 'package:zaheed/features/app/dashboard/views/bn_screens/profile/screens/profile_screen.dart';
import 'package:zaheed/prefs/shared_pref_controller.dart';

import '../../../../utils/extensions/color_resource.dart';
import '../../../../utils/extensions/icons_app.dart';
import '../../../../widgets/svg_picture.dart';
import '../models/bn_screen.dart';
import 'bn_screens/favorite/controller/favorite_controller.dart';
import 'bn_screens/favorite/view/screens/favorite_screen.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  HomeController homeController = Get.put(HomeController());
  FavoriteController favoriteController = Get.put(FavoriteController());
  CartController cartController = Get.put(CartController());

  int _currentIndex = 0;

  final List<BnScreen> _bnScreen = <BnScreen>[
    BnScreen(widget:  HomeScreen()),
    BnScreen(widget:  CartScreen()),
    BnScreen(widget: const FavoriteScreen()),
    BnScreen(widget: const ProfileScreen()),
  ];

  void changeTab(int index) {      //<-PageChange logic
    switch (index) {
      case 0:
        setState(
              () {
                homeController.getData();
            _currentIndex = 0;
          },
        );
        break;
      case 1:
        setState(
              () {
                cartController.getData();
                debugPrint('mmm=> ${SharedPrefController().token}');
            _currentIndex = 1;
          },
        );
        break;
      case 2:
        setState(
              () {
                favoriteController.getFavoriteData();
            _currentIndex = 2;
          },
        );
        break;
      case 3:
        setState(
              () {
            _currentIndex = 3;
          },
        );
        break;
      default:
        setState(
              () {
            _currentIndex = 0;
          },
        );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _bnScreen[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          changeTab(value);
        },
        currentIndex: _currentIndex,

        type: BottomNavigationBarType.fixed,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        backgroundColor: ColorResource.white,
        elevation: 8,

        selectedItemColor: ColorResource.primary,
        selectedIconTheme: const IconThemeData(color: ColorResource.primary),
        selectedFontSize: 10.sp,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        // iconSize: 16,

        unselectedItemColor: ColorResource.gray,
        unselectedIconTheme: const IconThemeData(color: ColorResource.black),
        unselectedFontSize: 10.sp,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),


        items: [
          BottomNavigationBarItem(
            icon: SVGPicture(
              assetName: IconsApp.homeOutLine,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: SVGPicture(
              assetName: IconsApp.home,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SVGPicture(
              assetName: IconsApp.cartOutLine,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: SVGPicture(
              assetName: IconsApp.cart,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SVGPicture(
              assetName: IconsApp.favoriteOutLine,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: SVGPicture(
              assetName: IconsApp.favorite,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SVGPicture(
              assetName: IconsApp.profileOutLine,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: SVGPicture(
              assetName: IconsApp.profile,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
