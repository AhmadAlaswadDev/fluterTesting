part of register;


class InputField extends GetView<RegistrationController> {
  InputField({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: context.localizations.name,
          color: ColorResource.darkBlue,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFieldIcon(
          inputType: TextInputType.text,
          obscureText: false,
          // icon: Icons.email,
          inputAction: TextInputAction.next,
          hint: '',
          contoller: controller.nameController,
        ),
        SizedBox(height: 24.h),
        TextApp(
          text: context.localizations.mobileNumber,
          color: ColorResource.darkBlue,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        IntlPhoneField(
          controller: controller.phoneController,
          flagsButtonPadding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            labelText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: const BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                  color: ColorResource.lightGray,
                  width: 2.w,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                  color: ColorResource.secondary,
                  width: 2.w,
                )),
          ),
          textInputAction: TextInputAction.next,
          initialCountryCode: 'SA',
          cursorColor: ColorResource.secondary,
          onChanged: (phone) {
            debugPrint(phone.completeNumber);
            debugPrint('mmm${phone.countryCode}');
            controller.phone.value = phone.completeNumber;
            debugPrint('mmm${controller.phone.value}');
          },
        ),
        SizedBox(height: 24.h),
        TextApp(
          text: context.localizations.password,
          color: ColorResource.darkBlue,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        Obx(() {
            return CustomTextFieldIcon(
              inputType: TextInputType.visiblePassword,
              obscureText: controller.isPasswordShow.value,
              icon: IconButton(
                onPressed: () {
                  controller.isPasswordShow.value = !controller.isPasswordShow.value;
                  // setState(() {
                  //   _isPasswordShow = !_isPasswordShow;
                  // });
                },
                icon: Icon(
                  controller.isPasswordShow.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: controller.isPasswordShow.value ? ColorResource.gray : ColorResource.secondary,
                ),
              ),
              inputAction: TextInputAction.go,
              hint: '',
              contoller: controller.passController,
            );
          }
        ),
      ],
    );
  }
}



