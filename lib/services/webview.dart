import 'dart:io';
import 'package:flutter/material.dart';
import 'package:msp/ui/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({@required this.url});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WebView(
            allowsInlineMediaPlayback: true,
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
