import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/common/utils.dart';
import 'package:flutter_journey/day1/star_view.dart';
import 'package:flutter_journey/day4/anim/lizi/ball.dart';

class RunBall extends StatefulWidget {
  @override
  _RunBallState createState() => _RunBallState();
}

class _RunBallState extends State<RunBall> with SingleTickerProviderStateMixin {
  AnimationController controller;

  var _oldTime = DateTime.now().millisecondsSinceEpoch;
  var _balls = <Ball>[];
  var _area = Rect.fromLTRB(0 + 40.0, 0 + 200.0, 280 + 40.0, 200 + 200.0);

  @override
  Widget build(BuildContext context) {
    var child = Scaffold(
      body: CustomPaint(
        painter: RunBallView(_balls, _area),
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

    var ball = Ball(
        x: 200,
        y: 300,
        color: Colors.blue,
        r: 40,
        aX: 0.05,
        aY: 0.1,
        vX: 3,
        vY: -3);
    _balls.add(ball); //添加一个

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
    for (var i = 0; i < _balls.length; i++) {
      updateBall(i);
    }
    setState(() {
      var now = DateTime.now().millisecondsSinceEpoch;
      print("时间差:${now - _oldTime}ms,帧率:${1000 / (now - _oldTime)}");
      _oldTime = now;
    });
  }

  void updateBall(int i) {
    var ball = _balls[i];
    if (ball.r < 0.3) {
      //半径小于0.3就移除
      _balls.removeAt(i);
    }

    ball.x += ball.vX;
    ball.y += ball.vY;
    ball.vX += ball.aX;
    ball.vY += ball.aY;

    //限定下边界
    if (ball.y > _area.bottom) {
      var newBall = Ball.fromBall(ball);
      newBall.r = newBall.r / 2;
      newBall.vX = -newBall.vX;
      newBall.vY = -newBall.vY;
      _balls.add(newBall);
      ball.r = ball.r / 2;

      ball.y = _area.bottom;
      ball.vY = -ball.vY;
      ball.color = randomRGB(); //碰撞后随机色
    }
    //限定上边界
    if (ball.y < _area.top) {
      ball.y = _area.top;
      ball.vY = -ball.vY;
      ball.color = randomRGB(); //碰撞后随机色
    }

    //限定左边界
    if (ball.x < _area.left) {
      ball.x = _area.left;
      ball.vX = -ball.vX;
      ball.color = randomRGB(); //碰撞后随机色
    }

    //限定右边界
    if (ball.x > _area.right) {
      var newBall = Ball.fromBall(ball);
      newBall.r = newBall.r / 2;
      newBall.vX = -newBall.vX;
      newBall.vY = -newBall.vY;
      _balls.add(newBall);
      ball.r = ball.r / 2;

      ball.x = _area.right;
      ball.vX = -ball.vX;
      ball.color = randomRGB(); //碰撞后随机色
    }
  }

  f(x) {
    var y = 5 * sin(4 * x); //函数表达式
    return y;
  }
}

class RunBallView extends CustomPainter {
  List<Ball> _balls; //小球集合
  Rect _area; //运动区域
  Paint mPaint; //主画笔
  Paint bgPaint; //背景画笔
  Paint linePaint; //主画笔

  RunBallView(this._balls, this._area) {
    mPaint = new Paint();
    bgPaint = new Paint()..color = Color.fromARGB(148, 198, 246, 248);
    linePaint = new Paint()
      ..color = Color.fromARGB(148, 198, 246, 248)
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _balls.forEach((ball) {
      _drawBall(canvas, ball);
    });
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
