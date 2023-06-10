part of checkout_view;


class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  final cardNumber = TextEditingController();
  final validUnit = TextEditingController();
  final cvv = TextEditingController();
  final cardHold = TextEditingController();

  late bool _isPasswordShow;
  @override
  void initState() {
    super.initState();
    _isPasswordShow = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: 'Card Number',
          color: ColorResource.darkBlue,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFieldIcon(
          inputType: TextInputType.number,
          obscureText: false,
          inputAction: TextInputAction.go,
          hint: '',
          contoller: validUnit,
          // contoller: controller.password,
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: 'Valid Unit',
                    color: ColorResource.darkBlue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFieldIcon(
                    inputType: TextInputType.number,
                    obscureText: false,
                    inputAction: TextInputAction.go,
                    hint: '',
                    contoller: validUnit,
                    // contoller: controller.password,
                  ),
                ],
              ),
            ),
            SizedBox(width: 24.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: 'CVV',
                    color: ColorResource.darkBlue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextFieldIcon(
                    inputType: TextInputType.number,
                    obscureText: false,
                    inputAction: TextInputAction.go,
                    hint: '',
                    contoller: validUnit,
                    // contoller: controller.password,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        TextApp(
          text: 'Card Holder',
          color: ColorResource.darkBlue,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFieldIcon(
          inputType: TextInputType.text,
          obscureText: false,
          inputAction: TextInputAction.go,
          hint: '',
          contoller: validUnit,
          // contoller: controller.password,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}



