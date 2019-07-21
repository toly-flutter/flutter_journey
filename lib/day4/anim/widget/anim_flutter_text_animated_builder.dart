import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class FlutterText extends StatefulWidget {
  final Widget child;

  FlutterText({this.child});

  _FlutterTextState createState() => _FlutterTextState();
}

class _FlutterTextState extends State<FlutterText>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    animation = TweenSequence<double>([ //使用TweenSequence进行多组补间动画
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 15), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 15, end: 0), weight: 2),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: -15), weight: 3),
      TweenSequenceItem<double>(tween: Tween(begin: -15, end: 0), weight: 4),
    ]).animate(controller);
    controller.forward();
  }

  Widget build(BuildContext context) {


    return FlutterAnim(animation: animation,child: widget.child,);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}


class FlutterAnim extends StatelessWidget {
  FlutterAnim({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    var result = AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Transform(
                transform: Matrix4.rotationZ(animation.value * pi / 180),
                alignment: Alignment.center,
                child: this.child);
          },
    );
    return Center(child: result,);
  }
}