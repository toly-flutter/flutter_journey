import 'dart:math';

import 'package:flutter/material.dart';

class FlutterText extends StatefulWidget {
  var str;
  var style;

  FlutterText({this.str, this.style});

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

    animation = TweenSequence<double>([//使用TweenSequence进行多组补间动画
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 15), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 13, end: -13), weight: 2),
      TweenSequenceItem<double>(tween: Tween(begin: -11, end: 11), weight: 3),
      TweenSequenceItem<double>(tween: Tween(begin: 9, end: -9), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: -7, end: 7), weight: 5),
      TweenSequenceItem<double>(tween: Tween(begin: 5, end: -5), weight: 6),
      TweenSequenceItem<double>(tween: Tween(begin: 3, end: -0), weight: 7),
    ]).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    var result = Transform(
      transform: Matrix4.rotationZ(animation.value * pi / 180),
      alignment: Alignment.center,
      child: Text(
        widget.str,
        style: widget.style,
      ),
    );

    return InkWell(child: result,    onTap: () {
//      controller.forward(); //点击时执行动画
      controller.repeat(reverse: true);
    },
      onDoubleTap: () {
        controller.stop(canceled: true); //双击击时暂停动画
      },);
  }
  dispose() {
    controller.dispose();
    super.dispose();
  }
}