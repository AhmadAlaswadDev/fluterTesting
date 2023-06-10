part of change_password_view;


class ChangePasswordButton extends StatefulWidget {
  const ChangePasswordButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  State<ChangePasswordButton> createState() => _ChangePasswordButtonState();
}

class _ChangePasswordButtonState extends State<ChangePasswordButton> {
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      title: widget.title,
      titleColor: ColorResource.white,
      fontSize: 15.sp,
      widthButton: double.infinity,
      heightButton: 50.h,
      radius: 5.r,
      backgroundColor: ColorResource.secondary,
      onPressed: widget.onPressed,
      assetName: '',
    );
  }
}




// class _LoginButton extends GetView<LoginController> {
//   const _LoginButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         height: 50,
//         width: MediaQuery.of(context).size.width * 0.75,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10), color: Color(0xFFFFB300)),
//         child: TextButton(
//           onPressed: controller.isLoading.value
//               ? null
//               : () => controller.login(
//                   context: context,
//                   password: controller.password.text,
//                   email: controller.email.text),
//           child: controller.isLoading.value
//               ? SizedBox(
//                   width: 30,
//                   height: 30,
//                   child: CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 )
//               : TextApp(
//                   text: LocaleKeys.signIn.tr,
//                   color: Color(0xFFFFFFFF),
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
