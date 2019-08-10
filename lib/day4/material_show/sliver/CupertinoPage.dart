import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/cons.dart';

class CupertinoPage extends StatefulWidget {
  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  var _position = 0;

  @override
  Widget build(BuildContext context) {
    var topBar = CupertinoNavigationBar(
      leading: Icon(
        CupertinoIcons.back,
        color: Colors.blue,
      ), //左
      middle: Text("Flutter之旅"), //中
      trailing: Image.asset(
        "images/icon_head.png", //右
        width: 30.0, height: 30.0,
      ),
      backgroundColor: Color(0xfff1f1f1),
    );

    var tabBar = CupertinoTabBar(
      onTap: (index) {
        print(index);
        _position = index;
        setState(() {});
      },
      currentIndex: _position,
      items: Cons.ICONS_MAP.keys.toList().map((e) {
        return BottomNavigationBarItem(
          icon: Icon(
            Cons.ICONS_MAP[e],
          ),
          title: Text(e),
        );
      }).toList(),
      activeColor: Colors.blue,
      inactiveColor: Color(0xff333333),
      backgroundColor: Color(0xfff1f1f1),
      iconSize: 25.0,
    );

    var body = CupertinoTabScaffold(
      tabBar: tabBar,
      tabBuilder: (context, index) => _buildTabView(context, index),
    );

    var app = CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: topBar,
        child: body,
      ),
    );

    return app;
  }

  void _showDialog(BuildContext cxt) {
    showCupertinoModalPopup<int>(
        context: cxt,
        builder: (cxt) {
          var dialog = CupertinoActionSheet(
            title: Text("Please chose a language"),
            message: Text('the language you use in this application.'),
            cancelButton: CupertinoActionSheetAction(
                onPressed: () {}, child: Text("Cancel")),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt);
                  },
                  child: Text('Dart')),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt);
                  },
                  child: Text('Java')),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt);
                  },
                  child: Text('Kotlin')),
            ],
          );
          return dialog;
        });
  }

  /// 根据所以[index]用上下文[context]创建CupertinoTabView
  _buildTabView(BuildContext context, int index) {
    return CupertinoTabView(
      builder: (context) {
        switch (index) {
          case 0:
            return Builder(
              builder: (context) => Align(
                alignment: Alignment.topCenter,
                child: CupertinoButton(
                    child: Text("Chose the language"),
                    onPressed: () {
                      _showDialog(context);
                    }),
              ),
            );
            break;
          default:
            return Align(
                alignment: Alignment(0, -0.8),
                child: Text("${Cons.ICONS_MAP.keys.toList()[index]}"));
        }
      },
    );
  }
}
