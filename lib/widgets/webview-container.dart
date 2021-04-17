import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_boilerplate/constants.dart';
import 'package:flutter_webview_boilerplate/utils/isAppLink.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewContainer extends StatefulWidget {
  @override
  createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _key = UniqueKey();
  bool goBack;
  InAppWebViewController webView;

  Future<bool> _onBack() async {
    bool canGoBack = await webView.canGoBack();
    if (canGoBack) {
      webView.goBack();
      return false;
    } else {
      await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                  title: new Text('Exit Confirmation'),
                  content: new Text('Do you really want to exit $APP_TITLE'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          setState(() {
                            goBack = false;
                          });
                        },
                        child: new Text('No')),
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                          setState(() {
                            goBack = true;
                          });
                        },
                        child: new Text('Yes'))
                  ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: WillPopScope(
                onWillPop: _onBack,
                child: InAppWebView(
                    key: _key,
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                            useShouldOverrideUrlLoading: true)),
                    initialUrlRequest: URLRequest(url: Uri.parse(WEBSITE_URL)),
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    shouldOverrideUrlLoading:
                        (InAppWebViewController controller,
                            NavigationAction navigationAction) async {
                      String url = navigationAction.request.url.toString();
                      bool shouldOpenApp = isAppLink(url);
                      if (shouldOpenApp) {
                        await launch(url);
                        return NavigationActionPolicy.CANCEL;
                      }
                      return NavigationActionPolicy.ALLOW;
                    })))
      ],
    );
  }
}
