import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_boilerplate/constants.dart';

class WebViewContainer extends StatefulWidget {
  @override
  createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: InAppWebView(
      key: _key,
      initialUrlRequest: URLRequest(url: Uri.parse(WEBSITE_URL)),
    ));
  }
}
