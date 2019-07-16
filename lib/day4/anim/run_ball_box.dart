import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/common/utils.dart';
import 'package:flutter_journey/day1/grid_line.dart';
import 'package:flutter_journey/day4/anim/ball.dart';

class RunBall extends StatefulWidget {
  @override
  _RunBallState createState() => _RunBallState();
}

class _RunBallState extends State<RunBall> with SingleTickerProviderStateMixin {
  AnimationController controller;

  var _oldTime = DateTime.now().millisecondsSinceEpoch;
  var _ball = Ball(color: Colors.blueAccent, r: 10,aY: 0.1, vX: 2, vY: -2,x: 10+100.0,y:200);
  var _area=Rect.fromLTRB(0+40.0,0+200.0,280+40.0,200+200.0);

  @override
  Widget build(BuildContext context) {
    var child = Scaffold(
      body: CustomPaint(
        painter: RunBallView(_ball,_area),
      ),
    );

    return GestureDetector(
      child: child,
      onTap: () {
        controller.forward(); //执行动画
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(days: 999 * 365), vsync: this);
    controller.addListener(() {
      _render();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 资源释放
  }

  //核心渲染方法
  _render() {
    updateBall();
    setState(() {
      var now = DateTime.now().millisecondsSinceEpoch;
//      print("时间差:${now - _oldTime}ms,帧率:${1000/(now - _oldTime)}");
      _oldTime = now;
    });
  }


//  更新小球位置
  void updateBall() {
    //运动学公式
    _ball.x += _ball.vX;
    _ball.y += _ball.vY;
    _ball.vX += _ball.aX;
    _ball.vY += _ball.aY;
    //限定下边界
    if (_ball.y > _area.bottom - _ball.r) {
      _ball.y = _area.bottom - _ball.r;
      _ball.vY = -_ball.vY;
      _ball.color=randomRGB();//碰撞后随机色
    }
    //限定上边界
    if (_ball.y < _area.top + _ball.r) {
      _ball.y = _area.top + _ball.r;
      _ball.vY = -_ball.vY;
      _ball.color=randomRGB();//碰撞后随机色
    }

    //限定左边界
    if (_ball.x < _area.left + _ball.r) {
      _ball.x = _area.left + _ball.r;
      _ball.vX = -_ball.vX;
      _ball.color=randomRGB();//碰撞后随机色
    }

    //限定右边界
    if (_ball.x > _area.right - _ball.r) {
      _ball.x = _area.right - _ball.r;
      _ball.vX= -_ball.vX;
      _ball.color=randomRGB();//碰撞后随机色
    }
  }
}

class RunBallView extends CustomPainter {
  Ball _ball; //小球
  Rect _area;//运动区域
  Paint mPaint; //主画笔
  Paint bgPaint; //背景画笔
  Paint linePaint; //主画笔

  RunBallView(this._ball,this._area) {
    mPaint = new Paint();
    bgPaint = new Paint()..color = Color.fromARGB(148, 198, 246, 248);
    linePaint = new Paint()..color = Color.fromARGB(148, 198, 246, 248)..style=PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
//    canvas.drawRect(_area, bgPaint);
    canvas.drawPath(gridPath(20, Size(1280,1980)), linePaint); //使用path绘制
    _drawBall(canvas, _ball);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  ///使用[canvas] 绘制某个[ball]
  void _drawBall(Canvas canvas, Ball ball) {
    canvas.drawCircle(
        Offset(ball.x, ball.y), ball.r, mPaint..color = ball.color);
  }
}
