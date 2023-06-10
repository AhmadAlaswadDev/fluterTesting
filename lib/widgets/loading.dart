import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions/color_resource.dart';
import '../utils/extensions/images_app.dart';


class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 73.0.h,
            width: 73.0.w,
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              valueColor: const AlwaysStoppedAnimation(ColorResource.red),
            ),
          ),
          Image.asset(
            // you can replace this with Image.asset
            ImagesApp.logoLaunch,
            fit: BoxFit.contain,
            height: 70.h,
            width: 70.w,
          ),
          // you can replace

        ],
      ),
    );
  }
}