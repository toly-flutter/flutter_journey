import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/iconfont.dart';
import 'package:flutter_journey/utils/common_path.dart';
class FloatingActionButtonTest extends StatelessWidget {
  FloatingActionButtonTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,//图标颜色
      child: Icon(TolyIcon.ios),
      elevation: 5,//z-阴影盖度
      shape: StarBorder(),//形状
    );

    return result;
  }
}

/// 边线形状类
class StarBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    print(rect.right);
    return nStarPath(9, 25,25 * cos((360 / 9 / 2)*pi / 180),dx: rect.height/2,dy: rect.width/2);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {

  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
