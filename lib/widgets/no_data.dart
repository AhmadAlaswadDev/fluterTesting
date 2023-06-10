import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions/color_resource.dart';


class NoData extends StatelessWidget {
  const NoData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: 30.h,),
          // SvgPicture.asset(
          //   ImagesApp.noData,
          //   height: 200.h,
          //   width: 200.w,
          // ),
          SizedBox(height: 50.h,),
          Text(
            // context.localizations.noDataFound,
            'No NearBy Store Found',
            // 'No Data Found',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              color: ColorResource.gray,
              fontWeight: FontWeight.w700,
            ),
          ),

        ],
      ),
    );
  }
}