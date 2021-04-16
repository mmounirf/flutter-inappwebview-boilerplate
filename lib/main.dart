import 'package:flutter/material.dart';
import 'package:flutter_webview_boilerplate/constants.dart';
import 'package:flutter_webview_boilerplate/widgets/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: ThemeData(
        primaryColor: BRAND_COLOR,
      ),
      home: Home(),
    );
  }
}
