import 'package:flutter/material.dart';

class IconButtonTest extends StatelessWidget {
  IconButtonTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconBtn = IconButton(
      padding: EdgeInsets.only(),
      onPressed: () {},
      icon: Icon(Icons.android, size: 40, color: Colors.deepPurpleAccent),//图标
      tooltip: "android",//长按提示字
      highlightColor: Colors.red, //点击时间稍长的时候背景渐变到这个颜色
      splashColor: Colors.blue, //点击时一闪而过的颜色
      disabledColor: Colors.blueGrey,//失效时颜色
    );
    return iconBtn;
  }
}
