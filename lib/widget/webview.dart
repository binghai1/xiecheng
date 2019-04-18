import 'package:flutter/material.dart';
  class WebView extends StatefulWidget {
    final String url;
    final String statusBarColor;
    final String title;
    final String hideAppBar;
    final String backForbid;

  const WebView({Key key, this.url, this.statusBarColor, this.title, this.hideAppBar, this.backForbid}) : super(key: key);
    @override
    _WebViewState createState() => _WebViewState();
  }
  class _WebViewState extends State<WebView> {
    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    @override
    Widget build(BuildContext context) {
      return Container(
        
      );
    }
  }
