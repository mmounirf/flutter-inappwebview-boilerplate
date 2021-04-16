import 'package:flutter/material.dart';
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

  Future<bool> _onBack() async {}

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
