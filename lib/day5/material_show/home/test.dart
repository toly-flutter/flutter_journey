import 'dart:math';

import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  final int alphaBg;
  final bool showStickItem;

  HeaderAppBar({this.alphaBg = 0, this.showStickItem = false});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;

    double reactHeight = 30;

    ///总高度 = appbar 高度 +  statusBar 高度 + 底部停靠区域高度
    double containerHeight = kToolbarHeight + statusBarHeight + reactHeight;

    var color = Theme.of(context).primaryColor.withAlpha(alphaBg);

    return  Material(
      color: Colors.transparent,
      child:  Container(
        alignment: Alignment.centerLeft,
        height: containerHeight,
        child:  Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ///撑满状态栏颜色
             Container(
              height: statusBarHeight,
              color: color,
            ),
             Container(
              color: color,
              height: kToolbarHeight,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white.withAlpha(125),
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                   Expanded(
                    child:  Container(
                      height: kToolbarHeight - 15,
                      margin: EdgeInsets.only(right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: Colors.white.withAlpha(125),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
            showStickItem
                ? Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10),
              height: reactHeight,
              color: Colors.amber,
              child:  Row(
                children: <Widget>[
                   Icon(Icons.ac_unit, color: Colors.white, size: 13),
                   SizedBox(
                    width: 10,
                  ),
                   Text(
                    "StickText",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
                :  Container()
          ],
        ),
      ),
    );
  }
}

class ListAnimDemoPage extends StatefulWidget {
  @override
  _ListAnimDemoPageState createState() => _ListAnimDemoPageState();
}

class _ListAnimDemoPageState extends State<ListAnimDemoPage> {

  int appBarColorAlpha = 0;///AppBar 的背景色透明度
  double scrollPix = 0;  ///记录滚动距离
  bool showStickItem = false;  ///是否需要显示停靠
  double headerHeight = 300;  ///头部区域高度
  double headerRectMargin = 40;  ///头部区域偏离图片高度
  double headerRectHeight = 60;///头部信息框高度


  ///头部区域
  _buildHeader() {
    ///状态栏高度
    double statusBarHeight =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;
    ///头部区域去除marin、appbar、状态栏之后的高度
    double dynamicValue =
        headerHeight - headerRectMargin - kToolbarHeight - statusBarHeight;

    ///计算 margin 的撑开动画效果，用于视觉偏差
    ///计算停靠 item 的显示标志 showStickItem
    double marginEdge = 0;
    if (scrollPix >= dynamicValue) {
      marginEdge = 10 - (scrollPix - dynamicValue);
      marginEdge = max(0, marginEdge);
      if (marginEdge == 0) {
        showStickItem = true;
      } else {
        showStickItem = false;
      }
    } else {
      marginEdge = 10;
      showStickItem = false;
    }

    return Container(
      alignment: Alignment.topCenter,
      height: headerHeight,
      child:  Stack(
        children: <Widget>[
           Image.asset(
            "images/wy_300x200_filter.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: headerHeight - headerRectMargin,
          ),
           Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: headerRectHeight,
              color: Colors.amber,
              margin: EdgeInsets.only(left: marginEdge, right: marginEdge),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                   Text(
                    "StickText",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                   Expanded(child:  Container()),
                   Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ///处理滑动监听
  _handleScrollUpdateNotification(ScrollUpdateNotification notification) {
    scrollPix = notification.metrics.pixels;
    var curAlpha = 0;
    if (notification.metrics.pixels <= 0) {
      curAlpha = 0;
    } else {
      curAlpha = ((notification.metrics.pixels / 180) * 255).toInt();
      if (curAlpha > 255) {
        curAlpha = 255;
      }
    }
    setState(() {
      appBarColorAlpha = curAlpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Scaffold(
          ///去除 SafeArea 的 padding
          body: MediaQuery.removePadding(
            context: context,
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            child: Container(
              child:  NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    _handleScrollUpdateNotification(notification);
                  }
                  return false;
                },
                child:  ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _buildHeader();
                    }
                    return Card(
                      child:  Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child:  Text("Item ${[index]} FFFFF"),
                      ),
                    );
                  },
                  itemCount: 100,
                ),
              ),
            ),
          ),
        ),
        HeaderAppBar(
          alphaBg: appBarColorAlpha,
          showStickItem: showStickItem,
        ),
      ],
    );
  }
}