part of checkout_view;

class PaymentMethodSelector extends StatelessWidget {
  final String paymentMethod;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodSelector({
    Key? key,
    required this.paymentMethod,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 90.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? ColorResource.primary.withOpacity(0.1) : ColorResource.lightGray,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: SVGPicture(
          assetName: paymentMethod,
        ),
      ),
    );
  }
}