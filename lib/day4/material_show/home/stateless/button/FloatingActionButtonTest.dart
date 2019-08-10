import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/iconfont.dart';

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
    return nStarPath(9, 25,25 * cos(_rad(360 / 9 / 2)),x: rect.height/2,y: rect.width/2);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {

  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}

/**
 * n角星路径
 *
 * @param num 几角星
 * @param R   外接圆半径
 * @param r   内接圆半径
 * @return n角星路径
 */
Path nStarPath(int num, double R, double r, {x = 0, y = 0}) {
  Path path = new Path();
  double perDeg = 360 / num; //尖角的度数
  double degA = perDeg / 2 / 2;
  double degB = 360 / (num - 1) / 2 - degA / 2 + degA;

  path.moveTo(cos(_rad(degA)) * R+x, (-sin(_rad(degA)) * R+y));
  for (int i = 0; i < num; i++) {
    path.lineTo(
        cos(_rad(degA + perDeg * i)) * R+x, -sin(_rad(degA + perDeg * i)) * R+y);
    path.lineTo(
        cos(_rad(degB + perDeg * i)) * r+x, -sin(_rad(degB + perDeg * i)) * r+y);
  }
  path.close();
  return path;
}

/**
 * 画正n角星的路径:
 *
 * @param num 角数
 * @param R   外接圆半径
 * @return 画正n角星的路径
 */
Path regularStarPath(int num, double R,{x = 0, y = 0}) {
  double degA, degB;
  if (num % 2 == 1) {
    //奇数和偶数角区别对待
    degA = 360 / num / 2 / 2;
    degB = 180 - degA - 360 / num / 2;
  } else {
    degA = 360 / num / 2;
    degB = 180 - degA - 360 / num / 2;
  }
  double r = R * sin(_rad(degA)) / sin(_rad(degB));
  return nStarPath(num, R, r,x: x,y:y);
}

/**
 * 画正n边形的路径
 *
 * @param num 边数
 * @param R   外接圆半径
 * @return 画正n边形的路径
 */
Path regularPolygonPath(int num, double R,{x = 0, y = 0}) {
  double r = R * cos(_rad(360 / num / 2)); //!!一点解决
  return nStarPath(num, R, r,x: x,y:y);
}

/**
 * 角度制化为弧度制
 *
 * @param deg 角度
 * @return 弧度
 */
double _rad(double deg) {
  return deg * pi / 180;
}

