part of login_view;


class InputField extends GetView<LoginController> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          textInputAction: TextInputAction.done,
          initialCountryCode: 'SA',
          cursorColor: ColorResource.secondary,
          onChanged: (phone) {
            debugPrint(phone.completeNumber);
            debugPrint('mmm${phone.countryCode}');
            controller.phone.value = phone.completeNumber;
            debugPrint('mmm${controller.phone.value}');
          },
        ),
      ],
    );
  }
}



