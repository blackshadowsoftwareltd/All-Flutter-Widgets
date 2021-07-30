import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google News'),
        actions: [NavigationControls(_controller.future)],
      ),
      body: Container(
        child: Builder(
          builder: (BuildContext context) {
            return WebView(
              initialUrl:
                  'https://cgresettlement.com/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webController) {
                _controller.complete(webController);
              },
            );
          },
        ),
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapShot) {
        final bool webViewReady =
            snapShot.connectionState == ConnectionState.done;
        final WebViewController controller = snapShot.data!;
        return Row(
          children: [
            IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller.canGoBack()) {
                          controller.goBack();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Loading..........')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No Back history Item')));
                        
                        }
                      }),
            IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        if (await controller.canGoForward()) {
                          controller.goForward();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Loading..........')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('No Forward history Item')));
                        }
                      }),
            IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: !webViewReady
                    ? null
                    : () async {
                        controller.reload();
                      })
          ],
        );
      },
    );
  }
}