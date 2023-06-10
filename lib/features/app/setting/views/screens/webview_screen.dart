import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zaheed/utils/extensions/context_extension.dart';
import 'package:zaheed/widgets/text_app.dart';

import '../../../../../utils/extensions/color_resource.dart';
import '../../../../../utils/get/policies_api/policies_api.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool _isLoadingPage = true;
  late WebViewController _webViewController;

  late Future<String> _privacyPolicy;
  late Future<String> _termsPolicy;

  String url = 'https://zaheed.sa/privacy-policy-2/';

  @override
  void initState() {
    super.initState();
    _privacyPolicy = PoliciesApiController().showPrivacyPolicies();
    _termsPolicy = PoliciesApiController().showTermsPolicies();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
      WebView.platform = SurfaceAndroidWebView(); // <<== THIS
    } else if (Platform.isIOS) {
      WebView.platform = CupertinoWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorResource.black,
          ),
        ),
        centerTitle: true,
        title: TextApp(text: widget.title, color: ColorResource.black),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (_isLoadingPage)
            const Center(
              child: CircularProgressIndicator(),
            ),
          WebView(
          //   initialUrl: '''
          //   <html>
          //     <head>
          //       <meta name="viewport" content="width=device-width, initial-scale=1.0">
          //     </head>
          //     <body>
          //       ${widget.title == context.localizations.privacy ? _privacyPolicy : _termsPolicy}
          //     </body>
          //   </html>
          // ''',
            initialUrl: url,
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            javascriptMode: JavascriptMode.unrestricted,
            allowsInlineMediaPlayback: true,
            zoomEnabled: false,
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
            debuggingEnabled: false,
            gestureNavigationEnabled: true,
          ),

        ],
      ),
    );
  }
}
