import 'package:flutter/widgets.dart';

import 'const_res.dart';

class ClockView extends CustomPainter {
  Paint mPaint;
  var _radius = 3.0; //小球半径
  Path mItemPath; //画笔对象

  ClockView() {
    //在工作方法中传入BuildContext对象
    mPaint = Paint(); //创建画笔对象
    mPaint.color = Color(0xff45d0fd); //画笔颜色
    mPaint.isAntiAlias = true; //抗锯齿
    mItemPath = Path();
    mItemPath
        .addOval(Rect.fromCircle(radius: _radius, center: Offset(0, 0))); //小球路径
    //mItemPath=nStarPath(5, _radius, _radius/2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    renderDigit(1, canvas);
    canvas.translate(65, 0);
    renderDigit(9, canvas);
    canvas.translate(65, 0);
    renderDigit(9, canvas);
    canvas.translate(65, 0);
    renderDigit(4, canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 是否应该重新绘制
    return true;
  }

  /**
   * 渲染数字
   * @param num    要显示的数字
   * @param canvas 画布
   */
  void renderDigit(int num, Canvas canvas) {
    if (num > 10) {
      return;
    }
    for (int i = 0; i < digit[num].length; i++) {
      for (int j = 0; j < digit[num][j].length; j++) {
        if (digit[num][i][j] == 1) {
          canvas.save();
          double rX = j * 2 * (_radius + 1) + (_radius + 1); //第(i，j)个点圆心横坐标
          double rY = i * 2 * (_radius + 1) + (_radius + 1); //第(i，j)个点圆心纵坐标
          canvas.translate(rX, rY);
          canvas.drawPath(mItemPath, mPaint);
          canvas.restore();
        }
      }
    }
  }
}
