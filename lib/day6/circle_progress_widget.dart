import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


///信息描述类 [value]为进度，在0~1之间,进度条颜色[color]，
///未完成的颜色[backgroundColor],圆的半径[radius],线宽[strokeWidth]
///小点的个数[dotCount] 样式[style] 完成后的显示文字[completeText]
class Progress {
  double value;
  Color color;
  Color backgroundColor;
  double radius;
  double strokeWidth;
  int dotCount;
  TextStyle style;
  String completeText;

  Progress(
      {this.value=0, this.color=Colors.blue, this.backgroundColor=Colors.grey,
        this.radius=30, this.strokeWidth=4, this.completeText = "OK",
        this.style, this.dotCount = 40});
}

///通过 [progress] 对象 创建圆形进度条
class CircleProgressWidget extends StatelessWidget {
  CircleProgressWidget({Key key, @required this.progress}) : super(key: key);
  final Progress progress;
  @override
  Widget build(BuildContext context) {

    var show = Container(//主体
      width: progress.radius * 2,
      height: progress.radius * 2,
      child: CustomPaint(
        painter: ProgressPainter(progress),
      ),
    );
    String txt = "${(100 * progress.value).toStringAsFixed(1)} %";
    var text = Text(//文字
      progress.value >= 1.0 ? progress.completeText : txt,
      style: progress.style ?? TextStyle(fontSize: progress.radius / 6),
    );
    return Stack(//拼合
      alignment: Alignment.center,
      children: <Widget>[show,text],
    );
  }
}

class ProgressPainter extends CustomPainter {
  Progress _progress;
  Paint mainPaint;
  Paint arrowPaint;
  Path arrowPath;
  double radius;

  ProgressPainter(this._progress,) {//初始化
    arrowPath = Path();
    arrowPaint = Paint()..isAntiAlias=true;
    mainPaint = Paint()..isAntiAlias=true;
    radius = _progress.radius - _progress.strokeWidth / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域
    canvas.translate(_progress.strokeWidth / 2, _progress.strokeWidth / 2);//处理边线宽的影响

    drawProgress(canvas);//绘制进度
    drawArrow(canvas);//绘制箭头
    drawDot(canvas);//绘制圆点
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  drawProgress(Canvas canvas) {
    canvas.save();
    mainPaint//背景
      ..style = PaintingStyle.stroke
      ..color = _progress.backgroundColor
      ..strokeWidth = _progress.strokeWidth;
    canvas.drawCircle(Offset(radius, radius), radius, mainPaint);

    mainPaint//进度
      ..color = _progress.color
      ..strokeWidth = _progress.strokeWidth * 1.2
      ..strokeCap = StrokeCap.round;
    double sweepAngle = _progress.value * 360; //完成角度
    canvas.drawArc(Rect.fromLTRB(0, 0, radius * 2, radius * 2),//绘制弧线
        -90 / 180 * pi, sweepAngle / 180 * pi, false, mainPaint);
    canvas.restore();
  }

  drawArrow(Canvas canvas) {
    canvas.save();
    canvas.translate(radius, radius);// 将画板移到中心
    canvas.rotate((180 + _progress.value * 360) / 180 * pi);//旋转相应角度
    var half = radius / 2;//基点
    var eg = radius / 50; //单位长
    arrowPath.moveTo(0, -half - eg * 2);
    arrowPath.relativeLineTo(eg * 2, eg * 6);
    arrowPath.lineTo(0, -half + eg * 2);
    arrowPath.lineTo(0, -half - eg * 2);
    arrowPath.relativeLineTo(-eg * 2, eg * 6);
    arrowPath.lineTo(0, -half + eg * 2);
    arrowPath.lineTo(0, -half - eg * 2);
    canvas.drawPath(arrowPath, arrowPaint);
    canvas.restore();
  }

  void drawDot(Canvas canvas) {
    canvas.save();
    int num = _progress.dotCount;
    canvas.translate(radius, radius);
    for (double i = 0; i < num; i++) {
      canvas.save();
      double deg = 360 / num * i;
      canvas.rotate(deg / 180 * pi);
      mainPaint
        ..strokeWidth = _progress.strokeWidth / 2
        ..color = _progress.backgroundColor
        ..strokeCap = StrokeCap.round;
      if (i * (360 / num) <= _progress.value * 360) {
        mainPaint..color = _progress.color;
      }
      canvas.drawLine(
          Offset(0, radius * 3 / 4), Offset(0, radius * 4 / 5), mainPaint);
      canvas.restore();
    }
    canvas.restore();
  }
}

/// 本组件的测试类  -------------使用--TestStateful()--------------
class TestCircleProgressWidget extends StatefulWidget {
  @override
  _TestCircleProgressWidgetState createState() => _TestCircleProgressWidgetState();
}

class _TestCircleProgressWidgetState extends State<TestCircleProgressWidget> {

  double value=0.0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 100), (timer) {//计时器模拟进度增加
      value += 0.01;//进度增加
      setState(() {});
      if (value >= 1) {
        setState(() {});
        timer.cancel();//大于1时取消计时器
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return CircleProgressWidget(
        progress: Progress(
            backgroundColor: Colors.white,
            value: value,
            radius: 100,
            completeText: "完成",
            color: Color(0xff46bcf6),
            strokeWidth: 4));
  }
}

var show= Container(
  child: TestCircleProgressWidget(),
  color: Colors.pink.withAlpha(66),
);