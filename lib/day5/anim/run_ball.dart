import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/day3/RenderObjectWidget/MultiChildRenderObjectWidget/layout_show.dart';

///小球信息描述类
class Ball {
  double aX; //加速度
  double aY; //加速度Y
  double vX; //速度X
  double vY; //速度Y
  double x; //点位X
  double y; //点位Y
  Color color; //颜色
  double r; //小球半径

  Ball(
      {this.x = 0,
      this.y = 0,
      this.color,
      this.r = 10,
      this.aX = 0,
      this.aY = 0,
      this.vX = 0,
      this.vY = 0});
}

class RunBallWidget extends StatefulWidget {
  final Size size;

  RunBallWidget({Key key, this.size}) : super(key: key);

  @override
  _RunBallWidgetState createState() => _RunBallWidgetState();
}

class _RunBallWidgetState extends State<RunBallWidget>
    with SingleTickerProviderStateMixin {
  var _ball = Ball(color: Colors.blueAccent,
      r: 10,aY: 0.1, vX: 2, vY: -2,x: 75,y:0);

  AnimationController controller;

  @override
  void initState() {
    controller = //创建AnimationController对象
        AnimationController(duration: Duration(days: 999 * 365), vsync: this)
          ..addListener(() {//添加监听,执行渲染
            _render();
          });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose(); // 资源释放
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var paint = CustomPaint(
      painter: RunBallPainter(_ball),
    );

    return InkWell(
      onTap: () {
        controller.forward();//点击时执行动画
      },
      onDoubleTap: (){
        controller.stop();
      },
      child: SizedBox.fromSize(child: paint, size: widget.size,
      ),
    );
  }

  double t=0.0;
  void _renderMath(){
    setState(() { //刷新屏幕
        t += pi / 180; //每次dx增加pi/180
        _ball.x += cos(t);
        _ball.y += 0.5*sin(t);
    });
  }

  //渲染方法，更新小球信息
  void _render() {
    setState(() { //刷新屏幕
      _ball.x += _ball.vX;//运动学公式
      _ball.y += _ball.vY;
      _ball.vX += _ball.aX;
      _ball.vY += _ball.aY;
      //限定下边界
      if (_ball.y > widget.size.height-2*_ball.r) {
        _ball.y = widget.size.height-2*_ball.r;
        _ball.vY = -_ball.vY;//Y速度反向
        _ball.color=randomRGB();//碰撞后随机色
      }
      //限定上边界
      if (_ball.y < 0) {
        _ball.y = 0;
        _ball.vY = -_ball.vY;//Y速度反向
        _ball.color=randomRGB();//碰撞后随机色
      }
      //限定左边界
      if (_ball.x < 0) {
        _ball.x = 0;
        _ball.vX = -_ball.vX;//X速度反向
        _ball.color=randomRGB();//碰撞后随机色
      }
      //限定右边界
      if (_ball.x > widget.size.width-2*_ball.r) {
        _ball.x = widget.size.width - 2 * _ball.r;
        _ball.vX = -_ball.vX; //X速度反向
        _ball.color = randomRGB(); //碰撞后随机色
      }
    });
  }
}

///画板Painter
class RunBallPainter extends CustomPainter {
  Ball _ball; //小球
  Paint mPaint; //主画笔
  Paint bgPaint; //背景画笔

  RunBallPainter(this._ball) {
    mPaint = new Paint();
    bgPaint = new Paint()..color = Color.fromARGB(148, 198, 246, 248);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域

    canvas.drawPaint(bgPaint);
    _drawBall(canvas, _ball);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  ///使用[canvas] 绘制[ball]
  void _drawBall(Canvas canvas, Ball ball) {
    canvas.drawCircle(Offset(ball.x + ball.r, ball.y + ball.r), ball.r,
        mPaint..color = ball.color);
  }
}
