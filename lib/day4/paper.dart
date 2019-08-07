import 'dart:math';

import 'package:flutter/material.dart';


class DrawObj {
  Color color;//颜色
  Offset pos;//位置

  DrawObj(this.color,this.pos);
}

class Circle extends DrawObj{
  double radius;//大小

  Circle(Color color, Offset pos,{this.radius=1}) : super(color, pos);
}



class PaperWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PaperWidgetState();

}

class _PaperWidgetState extends State<PaperWidget> {
  var _positions=<Circle>[];//点集
  var _lines=<List<Circle>>[];//线集
  Offset _oldPos;//记录上一点
  
  @override
  Widget build(BuildContext context) {
    var body=CustomPaint(
      painter: PaperPainter(lines: _lines),
    );

    var scaffold = Scaffold(
      body: body,
    );

    var result =GestureDetector(
      child: scaffold,
      onPanDown: _panDown,
      onPanUpdate: _panUpdate,
      onPanEnd: _panEnd,
      onDoubleTap: (){
        _lines.clear();
        _render();
      },
    );
    return result;
  }

  /// 按下时表示新添加一条线,并记录上一点位置
  void _panDown(DragDownDetails details) {
    print(details.toString());
    _lines.add(_positions);

    var x=details.globalPosition.dx;
    var y=details.globalPosition.dy;
    _oldPos= Offset(x, y);

  }

  ///渲染方法，将重新渲染组件
  void _render(){
    setState(() {

    });
  }
  ///移动中，将点添加到点集中
  void _panUpdate(DragUpdateDetails details) {
    var x=details.globalPosition.dx;
    var y=details.globalPosition.dy;
    var curPos = Offset(x, y);
    if ((curPos-_oldPos).distance>3) {//距离小于3不处理，避免渲染过多
      var len = (curPos-_oldPos).distance;
      var width =150* pow(len+6.5,-1.2);//TODO 处理不够顺滑，待处理
      var circle = Circle(Colors.blue, curPos,radius:width);
      _positions.add(circle);
      _oldPos=curPos;
      _render();
    }

  }
  /// 抬起后，将旧线拷贝到线集中
  void _panEnd(DragEndDetails details) {
    var oldBall = <Circle>[];
    for (int i = 0; i < _positions.length; i++) {
      oldBall.add(_positions[i]);
    }
    _lines.add(oldBall);
    _positions.clear();

  }
}

class PaperPainter extends CustomPainter{

  PaperPainter({
    @required this.lines,
  }) {
    _paint = Paint()..style=PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  Paint _paint;
  final List<List<Circle>> lines;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < lines.length; i++) {
      drawLine(canvas,lines[i]);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  ///根据点位绘制线
  void drawLine(Canvas canvas,List<Circle> positions) {
    for (int i = 0; i < positions.length - 1; i++) {
      if (positions[i] != null && positions[i + 1] != null)
        canvas.drawLine(positions[i].pos, positions[i + 1].pos, _paint..strokeWidth=positions[i].radius);
    }
  }

}

var show=PaperWidget();