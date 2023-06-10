import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/utils/extensions/color_resource.dart';

// ignore: must_be_immutable
class CustomTextFieldIcon extends StatelessWidget {
  CustomTextFieldIcon({
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.obscureText,
    this.icon,
    this.onChange,
    required this.contoller,
  });

  final String hint;
  late IconButton? icon;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obscureText;
  Function(String value)? onChange;
  final TextEditingController contoller;
  TextAlign textAlign  = TextAlign.center;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChange != null ? onChange!(value) : null,
      textCapitalization: TextCapitalization.words,
      // textDirection: TextDirection.ltr,
      keyboardType: inputType,
      style: const TextStyle(
        color: ColorResource.black
      ),
      controller: contoller,
      cursorColor: ColorResource.secondary,
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
        enabledBorder: getBorder(borderColor: ColorResource.lightGray),
        focusedBorder: getBorder(borderColor: ColorResource.secondary),
          contentPadding: EdgeInsets.all(12.w),
          suffixIcon: icon,
          // prefixIcon: icon,
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: ColorResource.gray,
          ),
          hintTextDirection: TextDirection.ltr
      ),
      obscureText: obscureText,
      textInputAction: inputAction,
    );
  }
  OutlineInputBorder getBorder({Color borderColor = ColorResource.gray}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: BorderSide(
          color: borderColor,
          width: 2.w,
        ));
  }
}
