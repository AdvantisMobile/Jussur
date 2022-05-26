import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'table_screen.dart';

class WebViewScreen extends StatefulWidget {

    @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.table_chart),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => TableScreen()
          ));
        },
      ),
      body: Stack(
        children: <Widget>[
          Container(
              child: InAppWebView(
              initialUrl: "https://jussuremdad.com",
              initialHeaders: {},
              initialOptions: InAppWebViewWidgetOptions(
inAppWebViewOptions: InAppWebViewOptions(
debuggingEnabled: true,
userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36"
),
),
              
              onWebViewCreated: (InAppWebViewController controller) {
                
              },
              onLoadStart: (InAppWebViewController controller, String url) {
                  setState(() {
                    isLoading = false;
                  });
              },
              onLoadStop: (InAppWebViewController controller, String url) {
                  setState(() {
                    isLoading = false;
                  });
              },
              onReceivedServerTrustAuthRequest: (InAppWebViewController controller, ServerTrustChallenge challenge) async {
                return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
              },
            ),
          ),
          isLoading ? Center( child: CircularProgressIndicator()) : Container(),
        ]),
    //   body: Container(
    //     padding: EdgeInsets.all(0),
    //     child: WebView(
    //       javascriptMode: JavascriptMode.unrestricted,
    //       debuggingEnabled: true,
    //       onWebViewCreated: (controller) {
    //         this._controller = controller;
    //         controller.loadUrl("https://jussuremdad.com");
    //       },
    //     ),
    //   )
    );
  }
}