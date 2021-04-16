import 'package:flutter/material.dart';
import 'package:flutter_webview_boilerplate/widgets/webview-container.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: WebViewContainer(),
    ));
  }
}
