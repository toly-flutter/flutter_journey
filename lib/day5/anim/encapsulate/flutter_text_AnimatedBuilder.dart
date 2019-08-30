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

    animation = TweenSequence<double>([
      //使用TweenSequence进行多组补间动画
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 15), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 13, end: -13), weight: 2),
      TweenSequenceItem<double>(tween: Tween(begin: -11, end: 11), weight: 3),
      TweenSequenceItem<double>(tween: Tween(begin: 9, end: -9), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: -7, end: 7), weight: 5),
      TweenSequenceItem<double>(tween: Tween(begin: 5, end: -5), weight: 6),
      TweenSequenceItem<double>(tween: Tween(begin: 3, end: -0), weight: 7),
    ]).animate(controller);
  }

  Widget build(BuildContext context) {
    return InkWell(
      child: SwingAnim(
        animation: animation,
        str: widget.str,
        style: widget.style,
      ),
      onTap: () {
        controller.reset();
        controller.forward(); //点击时执行动画
      },
      onDoubleTap: () {
        controller.stop(canceled: true); //双击击时暂停动画
      },
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimateWidget extends AnimatedWidget {
  AnimateWidget({Key key, Animation<double> animation, this.str, this.style})
      : super(key: key, listenable: animation);

  final String str;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    var result = Transform(
      transform: Matrix4.rotationZ(animation.value * pi / 180),
      alignment: Alignment.center,
      child: Text(str, style: style,),
    );
    return result;
  }
}


class SwingAnim extends StatelessWidget {
  SwingAnim({this.str, this.style,this.animation});
  final String str;
  final TextStyle style;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    var result = AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Transform(
            transform: Matrix4.rotationZ(animation.value * pi / 180),
            alignment: Alignment.center,
            child: Text(str, style: style,),);
      },
    );
    return result;
  }
}