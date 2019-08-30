import 'package:flutter/widgets.dart';

class GridLine extends CustomPainter {
  BuildContext context; //上下文对象
  Paint mPaint; //画笔对象

  GridLine(this.context) {
    //在构造方法中传入BuildContext对象
    mPaint = Paint(); //创建画笔对象
    mPaint.style = PaintingStyle.stroke; //画线条
    mPaint.color = Color(0xffBBC3C5); //画笔颜色
    mPaint.isAntiAlias = true; //抗锯齿
  }

  @override
  void paint(Canvas canvas, Size size) {
    // 实现绘制方法
    var winSize = MediaQuery.of(context).size; //获取屏幕尺寸
    canvas.drawPath(gridPath(20, winSize), mPaint); //使用path绘制
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 是否应该重新绘制
    return false;
  }
}

/**
 * 绘制网格路径
 *
 * @param step    小格边长
 * @param area 绘制区域
 */
Path gridPath(double step, Size area) {
  Path path = Path();
  for (int i = 0; i < area.height / step + 1; i++) {//画横线
    path.moveTo(0, step * i);//移动画笔
    path.lineTo(area.width, step * i);//画直线
  }

  for (int i = 0; i < area.width / step + 1; i++) {//画纵线
    path.moveTo(step * i, 0);
    path.lineTo(step * i, area.height);
  }
  return path;
}
