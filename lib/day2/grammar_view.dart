import 'package:flutter/widgets.dart';

import 'color_utils.dart';

class GrammarView extends CustomPainter {
  Paint mPaint; //画笔对象
  Path mPath;//路径

  GrammarView() {
    mPaint = Paint(); //创建画笔对象
    mPath=Path();

    mPaint.isAntiAlias = true; //抗锯齿
  }

  @override
  void paint(Canvas canvas, Size size) {
    mPaint.color = randomColor(); //画笔颜色
    mPath.addOval(Rect.fromCircle(radius: 15.0, center: Offset(15, 15))); //小球路径
    // 实现绘制方法
    canvas.drawPath(mPath, mPaint); //使用path绘制
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 是否应该重新绘制
    return true;
  }
}

