import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/utils/get/payment_api/get_telr_api.dart';
import 'package:zaheed/utils/models/payment_model/get_telr_model.dart';

import '../../../../utils/extensions/color_resource.dart';
import '../../../../widgets/text_app.dart';


class WebViewCheckoutScreen extends StatefulWidget {
  WebViewCheckoutScreen({Key? key, required this.combinedOrderId}) : super(key: key);
  final int combinedOrderId;

  @override
  State<WebViewCheckoutScreen> createState() => _WebViewCheckoutScreenState();
}

class _WebViewCheckoutScreenState extends State<WebViewCheckoutScreen> {

  WebViewController? _webViewController;

  late Future<GetTelrModel?> _future;

  Future<void> getTelrURL() async {
    _future = GetTelrApiController().getTelr(/*widget.combinedOrderId*/);
    debugPrint('mmm webView screen 😍=> ${widget.combinedOrderId}');
  }

  @override
  void initState() {
    super.initState();
    getTelrURL();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          centerTitle: true,
          title: TextApp(text: context.localizations.paymentMethods, color: ColorResource.secondary),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [

              ]),
        ),
      ),
    );
  }
}
