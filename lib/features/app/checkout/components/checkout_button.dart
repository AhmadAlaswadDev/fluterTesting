part of checkout_view;

class CheckoutButton extends StatefulWidget {
  const CheckoutButton({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        if(widget.id == 1){
          showDataAlert(context);
        }else{
         Navigator.pop(context);
        }
      },
      title: widget.id == 1 ? 'Checkout' : 'Save Change',
      assetName: '',
      titleColor: ColorResource.white,
      fontSize: 18.sp,
      widthButton: 156.w,
      heightButton: 50.h,
      radius: 5.r,
      backgroundColor: ColorResource.primary,
    );
  }

  showDataAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const CustomDialog();
        });
  }
}
