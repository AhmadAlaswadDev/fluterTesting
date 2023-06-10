import 'package:flutter/material.dart';
import 'package:zaheed/features/app/checkout/payment_time_selector.dart';
class CheckoutTime extends StatefulWidget {
  const CheckoutTime({Key? key}) : super(key: key);

  @override
  State<CheckoutTime> createState() => _CheckoutTimeState();
}

class _CheckoutTimeState extends State<CheckoutTime> {
  String _paymentTime = "Now";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PaymentTimeSelector(
            paymentTime: 'Now',
            isSelected: _paymentTime == "Now",
            onTap: () {
              setState(() {
                _paymentTime = "Now";

              });
            },
          ),

          SizedBox(width: 8),
          PaymentTimeSelector(
            paymentTime: "Receipt Time",
            isSelected: _paymentTime == "Receipt Time",
            onTap: () {
              setState(() {
                _paymentTime = "Receipt Time";

              });
            },
          ),
        ],
      ),
    );
  }
}
