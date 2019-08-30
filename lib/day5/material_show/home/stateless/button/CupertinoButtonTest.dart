import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_journey/iconfont.dart';

class CupertinoButtonTest extends StatelessWidget {
  CupertinoButtonTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = CupertinoButton(//iOS风格按钮
      padding: EdgeInsets.zero,//内间距
      onPressed: () {},//点击事件
      color: CupertinoColors.activeBlue,//按下时颜色
      pressedOpacity: 0.4,//按下时的透明度
      disabledColor: CupertinoColors.inactiveGray,//禁用时颜色
      child: Text("iOS"),
    );

    return result;
  }
}

