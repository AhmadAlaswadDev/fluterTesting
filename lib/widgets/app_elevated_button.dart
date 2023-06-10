import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaheed/widgets/svg_picture.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    required this.title,
    required this.titleColor,
    required this.fontSize,
    required this.widthButton,
    required this.heightButton,
    required this.radius,
    required this.backgroundColor,
    required this.onPressed,
    this.assetName,
    Key? key,
  }) : super(key: key);

  String title;
  double widthButton;
  double heightButton;
  double radius;
  Color titleColor;
  Color backgroundColor;
  double fontSize;
  final void Function() onPressed;
  String? assetName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(widthButton, heightButton),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SVGPicture(assetName: assetName!,color: Colors.white,),
          SizedBox(width: 5.w),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSize,
                // fontWeight: FontWeight.w700,
                color: titleColor),
          ),
        ],
      ),
    );
  }
}
