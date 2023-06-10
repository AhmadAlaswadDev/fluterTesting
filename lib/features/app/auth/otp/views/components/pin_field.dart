part of otp_view;


class _PinField extends GetView<OTPController> {

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      boxShadows: const [
        BoxShadow(color: ColorResource.black, blurRadius: 1, spreadRadius: 0),
        BoxShadow(color: ColorResource.white, blurRadius: 6, spreadRadius: 5),
      ],
      enablePinAutofill: true,
      keyboardType: TextInputType.number,
      animationDuration: const Duration(milliseconds: 200),
      controller: controller.otpController,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5.r),
        borderWidth: 0,
        fieldHeight: 50.h,
        fieldWidth: 50.w,
        activeFillColor: ColorResource.secondary,
        disabledColor: ColorResource.white,
        activeColor: ColorResource.secondary,
        inactiveColor: ColorResource.gray,
        selectedColor: ColorResource.black,
      ),
      appContext: context,
      onCompleted: (pin) async {
        debugPrint("finish");
        await controller.verifyPhoneNumber();
      },
      length: 6,
      onChanged: (String value) {
        controller.otpCode.value = value;
        debugPrint('mmm${controller.otpCode.value}');
        debugPrint('mmm${controller.otpController.text}');
      },
    );
  }
}

