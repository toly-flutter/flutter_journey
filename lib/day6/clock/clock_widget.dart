
import 'dart:math';

import 'package:flutter_journey/utils/color_utils.dart';

import 'cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/common_path.dart';
class ClockConfig{
  double width;
  ClockConfig({this.width=300});
}

class ClickWidget extends StatefulWidget {
  ClickWidget({Key key,this.config}):super(key:key);

  final ClockConfig config;
  @override
  _ClickWidgetState createState() => _ClickWidgetState();
}



class _ClickWidgetState extends State<ClickWidget> with SingleTickerProviderStateMixin{
  AnimationController controller;
  var _balls =  List<Ball>();
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat(); //执行动画
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 资源释放
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.config.width,
      height: widget.config.width*0.4,
      child: CustomPaint(painter: ClockPainter(widget.config,_balls),),
    );
  }
}

//小球信息类
class Ball {
  double aX; //加速度
  double aY; //加速度Y
  double vX; //速度X
  double vY; //速度Y
  double x; //点位X
  double y; //点位Y
  Color color; //颜色
  double r; //小球半径
  int tag;
  Ball({this.x, this.y, this.color, this.r, this.aX, this.aY, this.vX, this.vY,this.tag});
  //复制一个小球
  Ball.fromBall(Ball ball) {this.x = ball.x;this.y = ball.y;
  this.color = ball.color;this.r = ball.r;this.aX = ball.aX;
  this.aY = ball.aY;this.vX = ball.vX;this.vY = ball.vY;
  }
}


var currTime =  DateTime.now();

class ClockPainter extends CustomPainter {
  Paint mainPaint;//画笔
  double _radius;//半径
  DateTime now;//当前时间
  Path starPath; //半径
  ClockConfig config;
  var balls;//小球
  Random random;//随机数

  ClockPainter(this.config,this.balls) {
    mainPaint =  Paint();
    _radius=config.width/150;
    starPath = nStarPath(5, _radius, _radius / 2);
    now =  DateTime.now();
    random =  Random();
    addBallsWhenChanged();//当数字改变时添加
    updateBalls();//更新小球
  }
  @override
  void paint(Canvas canvas, Size size) {
 Rect rect = Offset.zero & size;
 canvas.clipRect(rect); //裁剪区域
    canvas.save();
    drawDigit(canvas);//绘制数字
    drawBalls(canvas, balls);//绘制小球
    canvas.restore();
  }

  void drawDigit(Canvas canvas) {
    renderDigit(now.hour ~/ 10, canvas);
    canvas.translate(20 * _radius, 0);
    renderDigit(now.hour % 10, canvas);
    canvas.translate(20 * _radius, 0);
    renderDigit(10, canvas);
    canvas.translate(12 * _radius, 0);
    renderDigit(now.minute ~/ 10, canvas);
    canvas.translate(20* _radius, 0);
    renderDigit(now.minute % 10, canvas);
    canvas.translate(20 * _radius, 0);
    renderDigit(10, canvas);
    canvas.translate(12 * _radius, 0);
    renderDigit(now.second ~/ 10, canvas);
    canvas.translate(20 * _radius, 0);
    renderDigit(now.second % 10, canvas);
  }

  //绘制小球
  void drawBalls(Canvas canvas, List<Ball> balls) {
    balls.forEach((ball) {
      mainPaint.color = ball.color;
      canvas.drawCircle(Offset(ball.x, ball.y), ball.r, mainPaint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // 是否应该重新绘制
    return true;
  }


  /// 添加倒计时中改动的点---变动加球
  void addBallsWhenChanged() {
    var now =  DateTime.now();
    var allow = currTime.second != now.second;//说明秒针需要变
    if (allow) {//判断当前时间是否改变,再将点位放到集合中
      if ((currTime.hour ~/ 10) != (now.hour ~/ 10)) {
        addBalls((-17 * 5 - 11 * 2) * _radius.toInt(), currTime.hour ~/ 10);
      }
      if ((currTime.hour % 10) != (now.hour % 10)) {
        addBalls((-17 * 4 - 11 * 2) * _radius.toInt(), currTime.hour % 10);
      }
      if ((currTime.minute ~/ 10) != (now.minute ~/ 10)) {
        addBalls((-18 * 3 - 11) * _radius.toInt(), currTime.minute ~/ 10);
      }
      if ((currTime.minute % 10) != (now.minute % 10)) {
        addBalls((-18 * 2 - 11) * _radius.toInt(), currTime.minute % 10);
      }
      if ((currTime.second ~/ 10) != (now.second ~/ 10)) {
        addBalls(-18 * _radius.toInt(), currTime.second ~/ 10);
      }
      if ((currTime.second % 10) != (now.second % 10)) {
        addBalls(0, currTime.second % 10);
        currTime = now;
      }
    }
  }

  //添加小球
  addBalls(int offsetX, int num) {
    for (int i = 0; i < digit[num].length; i++) {
      for (int j = 0; j < digit[num][i].length; j++) {
        if (digit[num][i][j] == 1) {
          Ball ball =  Ball();
          ball.aY = 0.1;
          ball.vX = pow(-1, random.nextInt(1000)) * 6 * random.nextDouble();
          ball.vY = 4 * random.nextDouble();
          ball.x = offsetX + j * 2 * (_radius + 1) + (_radius + 1); //第(i，j)个点圆心横坐标
          ball.y = i * 2 * (_radius + 1) + (_radius + 1); //第(i，j)个点圆心纵坐标
          ball.color = randomColor();
          ball.tag=DateTime.now().millisecondsSinceEpoch;
          ball.r = _radius;
          balls.add(ball);
        }
      }
    }
  }
  
  ///更新所有球的位置---让球运动 ,并在合适时机移除小球
  void updateBalls() {
  print(balls.length);
    for(var i = 0 ; i < balls.length ; i++) {
      var ball=balls[i];
      ball.x += ball.vX; //x=xo+v*t-----t=1
      ball.y += ball.vY;
      ball.y += ball.aY; //v=vo+a*t-----t=1
      if (ball.y >= config.width*0.4) {//超过Y底线，反弹
        ball.y = config.width*0.4;
        ball.vY = -ball.vY * 0.99;
      }
      if (ball.x<-config.width||ball.y<0) {//左界移除
        balls.remove(ball);
      }
      if (DateTime.now().millisecondsSinceEpoch - ball.tag > 3000) {
        balls.remove(ball);//如果粒子存在大于三秒，则移除
      }
    }
    
  }


  ///渲染数字[num]
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
          mainPaint.color = Colors.blue;
          canvas.drawPath(starPath, mainPaint);
          canvas.restore();
        }
      }
    }
  }
}

var show= ClickWidget(config: ClockConfig(width:500),);
