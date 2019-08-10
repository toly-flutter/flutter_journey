import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Ability {
  double radius;
  int duration;
  ImageProvider image;
  Map<String,double> data;
  Color color;

  Ability({this.radius, this.duration, this.image, this.data, this.color});

}

class AbilityWidget extends StatefulWidget {
  AbilityWidget({Key key, this.ability}) : super(key: key);

  final Ability ability;

  @override
  _AbilityWidgetState createState() => _AbilityWidgetState();
}

class _AbilityWidgetState extends State<AbilityWidget>
    with SingleTickerProviderStateMixin {
  var _angle = 0.0;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();


    controller = AnimationController(
        ////创建 Animation对象
        duration: Duration(milliseconds: widget.ability.duration), //时长
        vsync: this);

    var curveTween = CurveTween(curve:Cubic(0.96, 0.13, 0.1, 1.2));//创建curveTween
    var tween=Tween(begin: 0.0, end: 360.0);
    animation = tween.animate(curveTween.animate(controller));


    animation.addListener(() {
      setState(() {
        _angle = animation.value;
        print(_angle);
      });
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var paint = CustomPaint(
      painter: AbilityPainter(widget.ability.radius,widget.ability.data),
    );

    var outlinePainter = Transform.rotate(
      angle: _angle / 180 * pi,
      child: CustomPaint(
        painter: OutlinePainter(widget.ability.radius ),
      ),
    );

    var img = Transform.rotate(
      angle: _angle / 180 * pi,
      child: Opacity(
        opacity: animation.value / 360 * 0.4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.ability.radius),
          child: Image(
            image: widget.ability.image,
            width: widget.ability.radius * 2,
            height: widget.ability.radius * 2,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    var center = Transform.rotate(
        angle: -_angle / 180 * pi,
        child: Transform.scale(
          scale: 0.5 + animation.value / 360 / 2,
          child: SizedBox(
            width: widget.ability.radius * 2,
            height: widget.ability.radius * 2,
            child: paint,
          ),
        ));

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[img, center, outlinePainter],
      ),
    );
  }
}

class OutlinePainter extends CustomPainter {
  double _radius; //外圆半径
  Paint mLinePaint; //线画笔
  Paint mFillPaint; //填充画笔

  OutlinePainter(this._radius) {
    mLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.008 * _radius
      ..isAntiAlias = true;

    mFillPaint = Paint() //填充画笔
      ..strokeWidth = 0.05 * _radius
      ..color = Colors.black
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawOutCircle(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  //绘制外圈
  void drawOutCircle(Canvas canvas) {
    canvas.save(); //新建图层
    canvas.drawCircle(Offset(0, 0), _radius, mLinePaint); //圆形的绘制
    double r2 = _radius - 0.08 * _radius; //下圆半径
    canvas.drawCircle(Offset(0, 0), r2, mLinePaint);
    for (var i = 0.0; i < 22; i++) {
      //循环画出小黑条
      canvas.save(); //新建图层
      canvas.rotate(360 / 22 * i / 180 * pi); //旋转:注意传入的是弧度（与Android不同）
      canvas.drawLine(Offset(0, -_radius), Offset(0, -r2), mFillPaint); //线的绘制
      canvas.restore(); //释放图层
    }
    canvas.restore(); //释放图层
  }
}

class AbilityPainter extends CustomPainter {

  Map<String, double>  _data;
  double _r; //外圆半径
  Paint mLinePaint; //线画笔
  Paint mAbilityPaint; //区域画笔
  Paint mFillPaint; //填充画笔

  Path mLinePath; //短直线路径
  Path mAbilityPath; //范围路径

  AbilityPainter(this._r, this._data) {
    mLinePath = Path();
    mAbilityPath = Path();
    mLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.008 * _r
      ..isAntiAlias = true;

    mFillPaint = Paint() //填充画笔
      ..strokeWidth = 0.05 * _r
      ..color = Colors.black
      ..isAntiAlias = true;
    mAbilityPaint = Paint()
      ..color = Color(0x8897C5FE)
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //剪切画布
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect);

    canvas.translate(_r, _r); //移动坐标系
    drawInnerCircle(canvas);
    drawInfoText(canvas);
    drawAbility(canvas, _data.values.toList());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  //绘制内圈圆
  drawInnerCircle(Canvas canvas) {
    double innerRadius = 0.618 * _r; //内圆半径
    canvas.drawCircle(Offset(0, 0), innerRadius, mLinePaint);
    canvas.save();
    for (var i = 0; i < _data.length; i++) {
      //遍历6条线
      canvas.save();
      canvas.rotate(360/_data.length * i.toDouble() / 180 * pi); //每次旋转60°
      mLinePath.moveTo(0, -innerRadius);
      mLinePath.relativeLineTo(0, innerRadius); //线的路径
      for (int j = 1; j < _data.length; j++) {
        mLinePath.moveTo(-_r * 0.02, innerRadius / _data.length * j);
        mLinePath.relativeLineTo(_r * 0.02 * 2, 0);
      } //加5条小线
      canvas.drawPath(mLinePath, mLinePaint); //绘制线
      canvas.restore();
    }
    canvas.restore();
  }

  //绘制文字
  void drawInfoText(Canvas canvas) {
    double r2 = _r - 0.08 * _r; //下圆半径
    for (int i = 0; i < _data.length; i++) {
      canvas.save();
      canvas.rotate(360 / _data.length * i / 180 * pi + pi);
      drawText(canvas, _data.keys.toList()[i], Offset(-50, r2 - 0.22 * _r),
          fontSize: _r * 0.1);
      canvas.restore();
    }
  }

  //绘制区域
  drawAbility(Canvas canvas, List<double> value) {
    double step = _r * 0.618 / _data.length; //每小段的长度
    mAbilityPath.moveTo(0, -value[0] / (100/_data.length) * step); //起点
    for (int i = 1; i < _data.length; i++) {
      double mark = value[i] /  (100/_data.length);

      var deg=pi/180*(360/_data.length * i - 90);

      mAbilityPath.lineTo(mark * step * cos(deg), mark * step * sin(deg));
    }
    mAbilityPath.close();
    canvas.drawPath(mAbilityPath, mAbilityPaint);
  }

  //绘制文字
  drawText(Canvas canvas, String text, Offset offset,
      {Color color = Colors.black,
      double maxWith = 100,
      double fontSize,
      String fontFamily,
      TextAlign textAlign = TextAlign.center,
      FontWeight fontWeight = FontWeight.bold}) {
    //  绘制文字
    var paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontFamily: fontFamily,
        textAlign: textAlign,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
    paragraphBuilder.pushStyle(
        ui.TextStyle(color: color, textBaseline: ui.TextBaseline.alphabetic));
    paragraphBuilder.addText(text);
    var paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: maxWith));
    canvas.drawParagraph(paragraph, Offset(offset.dx, offset.dy));
  }
}
