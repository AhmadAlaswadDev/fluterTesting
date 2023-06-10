part of checkout_view;


class CheckoutCard extends StatefulWidget {
  const CheckoutCard({Key? key}) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {

  String _paymentMethod = "visa";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PaymentMethodSelector(
            paymentMethod: IconsApp.visa,
            isSelected: _paymentMethod == "Visa",
            onTap: () {
              setState(() {
                _paymentMethod = "Visa";
              });
            },
          ),
          SizedBox(width: 8.w),
          PaymentMethodSelector(
            paymentMethod: IconsApp.paypal,
            isSelected: _paymentMethod == "Paypal",
            onTap: () {
              setState(() {
                _paymentMethod = "Paypal";
              });
            },
          ),
        ],
      ),
    );
  }
}
