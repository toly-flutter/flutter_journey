import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimConfig {//动画配置
  int duration;//时长
  double offset;//偏移大小
  RockMode mode;//摇晃模式
  CurveTween curveTween;//运动曲线
   FinishCallback onFinish;

  AnimConfig({this.duration, this.offset, this.mode,this.curveTween,this.onFinish});
}

typedef FinishCallback = void Function();

class FlutterLayout extends StatefulWidget {
  final Widget child;
  final AnimConfig config;

  FlutterLayout({this.child, this.config});
  _FlutterLayoutState createState() => _FlutterLayoutState();
}

class _FlutterLayoutState extends State<FlutterLayout>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: widget.config.duration), vsync: this);

    var dx = widget.config.offset;

    var sequence = TweenSequence<double>([
      //使用TweenSequence进行多组补间动画
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: dx), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: dx, end: -dx), weight: 2),
      TweenSequenceItem<double>(tween: Tween(begin: -dx, end: dx), weight: 3),
      TweenSequenceItem<double>(tween: Tween(begin: dx, end: 0), weight: 4),
    ]);


    var curveTween = widget.config.curveTween;
    animation = sequence.animate(curveTween==null?controller:curveTween.animate(controller))
      ..addStatusListener((s) {
        if (s == AnimationStatus.completed) {
          if(widget.config.onFinish!=null)
            widget.config.onFinish();
        }
      });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return FlutterAnim(
        animation: animation, child: widget.child, config: widget.config);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class FlutterAnim extends StatelessWidget {
  FlutterAnim({this.child, this.animation, this.config});
  Random random = Random();
  final Widget child;
  final Animation<double> animation;
  final AnimConfig config;

  Widget build(BuildContext context) {
    var result = AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return new Transform(
            transform: _formTransform(config),
            alignment: Alignment.center,
            child: this.child);
      },
    );
    return Center(
      child: result,
    );
  }

  _formTransform(AnimConfig config) {
    var result;

    switch (config.mode) {
      case RockMode.random:
        result = Matrix4.rotationZ(animation.value * pi / 180);
        break;
      case RockMode.up_down:
        result = Matrix4.translationValues(0, animation.value*pow(-1, random.nextInt(20)), 0);
        break;
      case RockMode.left_right:
        result = Matrix4.translationValues(animation.value*pow(-1, random.nextInt(20)), 0, 0);
        break;
      case RockMode.lean:
        result = Matrix4.rotationZ(animation.value * pi / 180);
        break;
    }
    return result;
  }
}

enum RockMode {
  random, //随机
  up_down, //上下
  left_right, //左右
  lean //倾斜
}
