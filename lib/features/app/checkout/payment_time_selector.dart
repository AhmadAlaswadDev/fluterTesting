import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';


class PaymentTimeSelector extends StatelessWidget {
  final String paymentTime;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentTimeSelector({
    Key? key,
    required this.paymentTime,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 90.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          color: isSelected ? ColorResource.gray.withOpacity(0.3) : ColorResource.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Container(
          child: Text('$paymentTime'),
        ),
      ),
    );
  }
}