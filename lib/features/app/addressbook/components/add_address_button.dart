part of addressbook_view;

class AddAddressButton extends StatefulWidget {
  const AddAddressButton({Key? key}) : super(key: key);

  @override
  State<AddAddressButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<AddAddressButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 15.h),
      child: AppElevatedButton(
        onPressed: () {},
        title: 'Add Address',
        assetName: '',
        titleColor: ColorResource.white,
        fontSize: 18.sp,
        widthButton: 156.w,
        heightButton: 50.h,
        radius: 5.r,
        backgroundColor: ColorResource.secondary,
      ),
    );
  }
}
