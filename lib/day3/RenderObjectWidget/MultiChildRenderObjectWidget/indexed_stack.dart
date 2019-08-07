import 'package:flutter/material.dart';

baseTest() {
  var stack = IndexedStack(
    index: 3,
    alignment: Alignment(3, 3), //对齐方式
    children: <Widget>[
      getBox(80, Colors.yellow),
      getBox(70, Colors.red),
      getBox(60, Colors.green),
      getBox(50, Colors.cyanAccent),
    ],
  );

  return stack;
}

/// 获取一个方形盒子，其中边长是[width],颜色是[color]
Widget getBox(double width, Color color) => Container(
  color: color, //容器的颜色
  width: width, //容器宽
  height: width, //容器高
);

var show = baseTest();
