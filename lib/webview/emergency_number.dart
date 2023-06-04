import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
class EmergencyNumber extends StatelessWidget {
  var controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.adducation.info/general-knowledge-travel-and-transport/emergency-numbers/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://www.adducation.info/general-knowledge-travel-and-transport/emergency-numbers/'));
  // This widget is the root of your application.
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Emergency Number'), 
    backgroundColor: Color(0xFFE35970),),
    body: WebViewWidget(controller: controller),
  );
}
  }