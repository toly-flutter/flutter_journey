import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatefulWidget {
  String url;
  final String title;

  WebViewPage({this.url, this.title="toly"});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
   WebViewController webCtrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    webCtrl.clearCache();//清除产生的缓存
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: ()=>webCtrl?.goBack(),//web页面返回
            child: Text(widget.title)),
      ),
      body: Stack(
        children: <Widget>[
           WebView(
            javascriptMode: JavascriptMode.unrestricted,//默认禁止js
            initialUrl: widget.url, //初始url
            onWebViewCreated: (WebViewController web) {//WebView被创建时回调
              webCtrl=web;
              web.loadUrl("https://juejin.im/user/5b42c0656fb9a04fe727eb37/collections");//此时也可以初始化一个url
              web.canGoBack().then((res){
                print("是否能后退：$res"); //是否能后退
              });
              web.currentUrl().then((url){
                print("当前url：$url");// 返回当前url
              });
              web.canGoForward().then((res){
                print("是否能前进：$res"); //是否能前进
              });
            },
            onPageFinished: (String value) {
              print("页面加载结束：$value"); //页面加载结束
            },
          )
        ],
      ),
    );
  }
}