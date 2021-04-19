import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_boilerplate/constants.dart';
import 'package:flutter_webview_boilerplate/widgets/webview-container.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: BRAND_COLOR),
        child: Scaffold(
          body: SafeArea(child: WebViewContainer()),
        ));
  }
}
