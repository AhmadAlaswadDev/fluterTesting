part of change_password_view;


class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();

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
          text: 'Old Password',
          color: ColorResource.darkBlue,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFieldIcon(
          inputType: TextInputType.visiblePassword,
          obscureText: true,
          inputAction: TextInputAction.go,
          hint: '',
          contoller: oldPassword,
        ),
        SizedBox(height: 24.h),
        TextApp(
          text: context.localizations.password,
          color: ColorResource.darkBlue,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFieldIcon(
          inputType: TextInputType.visiblePassword,
          obscureText: _isPasswordShow,
          icon: IconButton(
            onPressed: () {
              setState(() {
                _isPasswordShow = !_isPasswordShow;
              });
            },
            icon: Icon(
              _isPasswordShow
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: _isPasswordShow ? ColorResource.gray : ColorResource.secondary,
            ),
          ),
          inputAction: TextInputAction.go,
          hint: '',
          contoller: newPassword,
        ),
      ],
    );
  }
}



