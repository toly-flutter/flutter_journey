import 'package:flutter/material.dart';
import 'package:flutter_journey/common/utils.dart';
///小球信息描述类
class Ball {
  double aX; //加速度
  double aY; //加速度Y
  double vX; //速度X
  double vY; //速度Y
  double x; //点位X
  double y; //点位Y
  Color color; //颜色
  double r;//小球半径

  Ball({this.x=0, this.y=0, this.color, this.r=10, this.aX=0, this.aY=0, this.vX=0, this.vY=0});//复制一个小球

  Ball.fromBall(Ball ball) {
    this.x = ball.x;
    this.y = ball.y;
    this.color = ball.color;
    this.r = ball.r;
    this.aX = ball.aX;
    this.aY = ball.aY;
    this.vX = ball.vX;
    this.vY = ball.vY;
  }

}
