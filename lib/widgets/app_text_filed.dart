import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/extensions/color_resource.dart';

class AppTextFiled extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final IconButton? suffixIcon;
  final int maxLine;
  late FontWeight? fontWeight;
  late double? fontSize;
  TextAlign? textAlign;
  Color fontColor;
  final double radius;
  final String errorText;
  late double? errorFontSize;
  late FontWeight? errorFontWeight;
  Color errorFontColor;

  AppTextFiled({
    required this.textEditingController,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLine = 1,
    required this.radius,
    required this.fontColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    required this.fontSize,
    this.errorText = '',
    this.errorFontSize = 0,
    this.errorFontWeight = FontWeight.normal,
    this.errorFontColor = ColorResource.transparent,

  });

  @override
  State<AppTextFiled> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText,
      maxLines: widget.maxLine,
      decoration: InputDecoration(
        border: getBorder(borderColor: ColorResource.gray),
        enabledBorder: getBorder(borderColor: ColorResource.gray),
        focusedBorder: getBorder(borderColor: ColorResource.primary),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.fontColor),
        // TODO: Make Color red
        // errorBorder: getBorder(borderColor: ColorResource.gray),
        // errorText: widget.errorText,
        // errorStyle: TextStyle(
        //     fontSize: widget.errorFontSize,
        //     fontWeight: widget.errorFontWeight,
        //     color: widget.errorFontColor),

        hintMaxLines: 1,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = ColorResource.gray}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        borderSide: BorderSide(
          color: borderColor,
          width: 2.w,
        ));
  }
}
