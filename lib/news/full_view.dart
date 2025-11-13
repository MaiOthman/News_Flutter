import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullView extends StatefulWidget {


  FullView({super.key});


  @override
  State<FullView> createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Articles;
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(Theme.of(context).cardColor)
                  ..loadRequest(Uri.parse(args.url!))
          )
        ));
  }
}
