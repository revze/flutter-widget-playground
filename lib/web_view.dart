import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/platform_interface.dart';

class WebViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewState();
  }
}

class _WebViewState extends State {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
        actions: <Widget>[
//          NavigationCon
        ],
      ),
      body: Column(children: <Widget>[
        RaisedButton(onPressed: () {
          _controller.loadUrl("https://tukang.com");
        }, child: Text('Load WebView'),),
        Expanded(child: WebView(
//          initialUrl: 'https://tukang.com/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController c) {
            _controller = c;
          },
        ))
      ],),
    );
  }
}
