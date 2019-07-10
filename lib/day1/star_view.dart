import 'dart:math';
import 'package:flutter/widgets.dart';

class StarView extends CustomPainter {
  Paint mPaint; //画笔对象

  StarView() {
    //在工作方法中传入BuildContext对象
    mPaint = Paint(); //创建画笔对象
    mPaint.color = Color(0xffff0000); //画笔颜色
    mPaint.isAntiAlias = true; //抗锯齿
  }

  @override
  void paint(Canvas canvas, Size size) {
    // 实现5角星绘制方法
    canvas.translate(50, 50);//移动到坐标系原点
    canvas.drawPath(nStarPath(5, 50, 20), mPaint); //使用path绘制

    // 实现8角星绘制方法
    canvas.translate(100, 0);//移动到坐标系原点
    canvas.drawPath(nStarPath(28, 50, 20), mPaint); //使用path绘制

    // 实现8角星绘制方法
    canvas.translate(100, 0);//移动到坐标系原点
    canvas.drawPath(nStarPath(98, 50, 20), mPaint); //使用path绘制
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 是否应该重新绘制
    return true;
  }
}

/**
 * n角星路径
 *
 * @param num 几角星
 * @param R   外接圆半径
 * @param r   内接圆半径
 * @return    n角星路径
 */
Path nStarPath(int num, double R, double r) {
  Path path = new Path();
  double perDeg = 360 / num;
  double degA = 70;
  double degB =(360 / (num - 1) - degA)/2 + degA;

  path.moveTo(cos(_rad(degA)) * R, (-sin(_rad(degA)) * R));
  for (int i = 0; i < num; i++) {
    path.lineTo(
        cos(_rad(degA + perDeg * i)) * R, -sin(_rad(degA + perDeg * i)) * R);
    path.lineTo(
        cos(_rad(degB + perDeg * i)) * r, -sin(_rad(degB + perDeg * i)) * r);
  }
  path.close();
  return path;
}

double _rad(double deg) {
  return deg * pi / 180;
}
