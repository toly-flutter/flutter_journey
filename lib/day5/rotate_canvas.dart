import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CtrlPanelConfig {
  double radius; //半径
  Color pointColor;
  double aX;
  double aY;
  double oX;
  double oY;
  double pX;
  double pY;
  double deg;

  CtrlPanelConfig(
      {this.radius = 150,
      this.pointColor = Colors.grey,
      this.aX,
      this.oX,
      this.pX,
      this.aY,
      this.oY,
      this.pY,
      this.deg = 30}); //指针颜色

}

class CtrlPanel extends StatefulWidget {
  CtrlPanel({Key key, this.config}) : super(key: key);
  final CtrlPanelConfig config;

  @override
  _CtrlPanelState createState() => _CtrlPanelState();
}

class _CtrlPanelState extends State<CtrlPanel> {
  @override
  Widget build(BuildContext context) {
    var showBox = Container(
      height: widget.config.radius * 2,
      width: widget.config.radius * 2,
      color: Colors.green,
      child: CustomPaint(
        painter: CtrlPainter(widget.config),
      ),
    );

    var sliderDeg = Slider(
      value: widget.config.deg,
      min: 0.0,
      max: 360.0,
      divisions: 360,
      label: widget.config.deg.toStringAsFixed(1),
      onChanged: (value) {
        widget.config.deg = value;
        setState(() {});
      },
    );
    var sliderAX = Slider(
      value: widget.config.aX,
      min: 0.0,
      max: widget.config.radius * 2,
      divisions: 100,
      onChanged: (value) {
        widget.config.aX = value;
        setState(() {});
      },
    );
    var sliderAY = Slider(
      value: widget.config.aY,
      min: 0.0,
      max: widget.config.radius * 2,
      divisions: 100,
      onChanged: (value) {
        widget.config.aY = value;
        setState(() {});
      },
    );

    var sliderPX = Slider(
      value: widget.config.pX,
      min: 0.0,
      max: widget.config.radius * 2,
      divisions: 100,
      onChanged: (value) {
        widget.config.pX = value;
        setState(() {});
      },
    );
    var sliderPY = Slider(
      value: widget.config.pY,
      min: 0.0,
      max: widget.config.radius * 2,
      divisions: 100,
      onChanged: (value) {
        widget.config.pY = value;
        setState(() {});
      },
    );
    var sliderOX = Slider(
      value: widget.config.oX,
      min: 0.0,
      max: widget.config.radius * 2,
      divisions: 100,
      onChanged: (value) {
        widget.config.oX = value;
        setState(() {});
      },
    );
    var sliderOY = Slider(
      value: widget.config.oY,
      min: 0.0,
      max: widget.config.radius * 2,
      divisions: 100,
      onChanged: (value) {
        widget.config.oY = value;
        setState(() {});
      },
    );
    return Column(
      children: <Widget>[
        showBox,
        Row(children: <Widget>[Text("旋转角度:\n ${widget.config.deg.toStringAsFixed(1)}"), Expanded(child: sliderDeg)],),
//        Row(children: <Widget>[Text("红色X:\n ${widget.config.aX.toStringAsFixed(1)}"), Expanded(child: sliderAX)],),
//        Row(children: <Widget>[Text("红色Y:\n ${widget.config.aY.toStringAsFixed(1)}"), Expanded(child: sliderAY)],),
        Row(children: <Widget>[Text("蓝色X:\n ${widget.config.pX.toStringAsFixed(1)}"), Expanded(child: sliderPX)],),
        Row(children: <Widget>[Text("蓝色Y:\n ${widget.config.pY.toStringAsFixed(1)}"), Expanded(child: sliderPY)],),
        Row(children: <Widget>[Text("黄色X:\n ${widget.config.oX.toStringAsFixed(1)}"), Expanded(child: sliderOX)],),
        Row(children: <Widget>[Text("黄色Y:\n ${widget.config.oY.toStringAsFixed(1)}"), Expanded(child: sliderOY)],),
      ],
    );
  }
}

class CtrlPainter extends CustomPainter {
  var r;
  var outWidth;
  var outAngle = 150;
  var perDeg;

  CtrlPainter(this.config) {
    r = config.radius;
    a = Offset(config.aX, config.aY);
    o =  Offset(config.oX, config.oY);
    p =  Offset(config.pX, config.pY);
    angle = config.deg;

    mainPaint = Paint()
      ..color = Colors.cyanAccent
      ..isAntiAlias = true;

    outWidth = r / 25;
    r = r - outWidth / 2;
    outPaint = Paint()
      ..color = Colors.black
      ..isAntiAlias = true
      ..strokeWidth = outWidth
      ..style = PaintingStyle.stroke;
    linePaint = Paint()
      ..color = Colors.white
      ..isAntiAlias = true
      ..strokeWidth = r / 150
      ..style = PaintingStyle.stroke;
  }

  Paint mainPaint;
  Paint outPaint;
  Paint linePaint;

  Offset a;
  Offset o;
  Offset p;
  double angle;

  final CtrlPanelConfig config;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域
//
//  canvas.rotate(rad(45));
    canvas.drawCircle(a, 10, mainPaint..color = Colors.red);
    canvas.drawCircle(o, 10, mainPaint..color = Colors.yellow);
    canvas.drawCircle(p, 10, mainPaint..color = Colors.cyanAccent);
//    canvas.translate(outWidth / 2, outWidth / 2);
    drawOutLine(canvas);
//    canvas.translate(r, r);
//    drawDot(canvas,linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  void drawOutLine(
    Canvas canvas,
  ) {
    var aX = a.dx;
    var aY = a.dy;

    var oX = o.dx;
    var oY = o.dy;
    var pX = p.dx;
    var pY = p.dy;

    var lenAP = sqrt((pX - aX) * (pX - aX) + (pY - aY) * (pY - aY));
    var angeleAP = atan((pY - aY) / (pX - aX)) * 180 / pi;
    var angleAP1 = angeleAP + angle; //ap1点水平夹角

    var p1X = lenAP * cos(rad(angleAP1));
    var p1Y = lenAP * sin(rad(angleAP1));
//    var p1 = Offset(p1X, p1Y); //p1点坐标



    var lenOP = sqrt((pX - oX) * (pX - oX) + (pY - oY) * (pY - oY)); //op长
//    var lenOA=sqrt((aX-oX)*(aX-oX)+(aY-oY)*(aY-oY));//oa长
//    var angeleOA= atan((aY-oY)/(aX-oX))*180/pi;
//    var angeleOP = atan((oY - pY) / (oX - pX)) * 180 / pi; //op水平夹角
    var angeleOP = asin((oY - pY) / lenOP) * 180 / pi; //op水平夹角
    print(angeleOP);
    var angleOP2 = 180-(angeleOP - angle);

    var p2X = lenOP * cos(rad(angleOP2)) + oX;
    var p2Y = oY - lenOP * sin(rad(angleOP2));

//    canvas.drawCircle(
//        Offset(p1X, p1Y), 10, mainPaint..color = Colors.cyanAccent.withAlpha(99));
//    canvas.drawCircle(
//        Offset(p2X, p2Y), 10, mainPaint..color = Colors.yellow.withAlpha(99));

    canvas.save();
    canvas.translate(p2X-p1X, -(p2Y-p1Y));
    canvas.rotate(rad(angle));
    canvas.drawCircle(
        p, 10, mainPaint..color = Colors.cyanAccent.withAlpha(99));
    canvas.restore();


//    canvas.drawArc(Rect.fromLTRB(0, 0, r * 2, r * 2), rad(-30), rad(360.0 - outAngle+30), false, outPaint);
  }

  void rotate(Canvas canvas, Offset o) {}

  void drawDot(Canvas canvas, Paint paint) {
    double deg = 150;
    double areaDeg = 360 - deg;
    perDeg = areaDeg / 180.0;

    for (int i = 0; i <= 180; i++) {
      if (i % 10 == 0) {
        canvas.save();
        double newDeg = i * perDeg + 150 + 15;
        canvas.rotate(rad(newDeg + 180));
        canvas.drawLine(Offset(r - 21, 0), Offset(r - 4, 0), paint);
        canvas.restore();

        double offsetX = r * 0.77 * cos(rad(newDeg));
        double offsetY = r * 0.77 * sin(rad(newDeg)) + r / 80;

//        canvas.drawText(texts[i / 10], offsetX, offsetY, textPaint);

      } else {
        canvas.save();
        canvas.rotate(rad(i * perDeg + 150 + 15 + 180));
        canvas.drawLine(Offset(r - 16, 0), Offset(r - 8, 0), paint);
        canvas.restore();
      }
    }
  }
}

double rad(double deg) {
  return deg * pi / 180;
}

Offset a = Offset(0, 0);
Offset o = Offset(250, 200);
Offset p = Offset(150, 120);
var show = CtrlPanel(
  config: CtrlPanelConfig(aX: a.dx, aY:a.dy,oX: o.dx,oY: o.dy, pX: p.dx,pY: p.dx),
);
