import 'dart:math';

import 'package:flutter/material.dart';

enum FlutterMode {//颤动的模式
  random,//随机模式
  up_down, //上下
  left_right, //左右
  swing //倾斜
}
//动画配置信息
class AnimConfig {//动画配置
 final int duration;//时长
 final double offset;//偏移大小
 final FlutterMode mode;//摇晃模式
 final Curve curve;//运动曲线
  AnimConfig({this.duration=1000, this.offset=15, this.mode=FlutterMode.swing,this.curve=Curves.bounceIn});
}

typedef FinishCallback = void Function();

class FlutterContainer extends StatefulWidget {
  final Widget child;
  final AnimConfig config;
  final FinishCallback onFinish;

  FlutterContainer({Key key,@required this.child,@required this.config,this.onFinish}):super(key:key);
  _FlutterContainerState createState() => _FlutterContainerState();
}

class _FlutterContainerState extends State<FlutterContainer>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Random random;

  initState() {
    super.initState();
    random = Random();
    controller = AnimationController(
        duration:  Duration(milliseconds: widget.config.duration), vsync: this);

    var offset = widget.config.offset;//偏移量
    var offsets=<Offset>[];//起止值的列表盛放在offsets里
    offsets.add(Offset(0, offset));//添加第一个
    var temp=offset;//临时变量
    for(var i=1;i<=offset;i++){
      temp--;//临时变量减小
      offsets.add(i.isOdd?Offset(temp, -temp):Offset(-temp, temp));//动态添加
    }
print(offsets);

    var curveTween = CurveTween(curve: widget.config.curve);//速率曲线
    animation = TweenSequence<double>(offsets.map((e){
      return TweenSequenceItem<double>(tween: Tween(begin: e.dx, end: e.dy),weight: 1);
    }).toList()).animate(curveTween.animate(controller))
      ..addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        if(widget.onFinish!=null)
          widget.onFinish();
      }
    });
    controller.forward(); //点击时执行动画
  }

  Widget build(BuildContext context) {

//    return InkWell(
////      child: _buildWidgetByMode(widget.config.mode),
////      onTap: () {
////        controller.reset();
////        controller.forward(); //点击时执行动画
////      },
////      onDoubleTap: () {
////        controller.stop(canceled: true); //双击击时暂停动画
////      },
////    );
  return _buildWidgetByMode(widget.config.mode);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  ///根据类型创建组件
  _buildWidgetByMode(FlutterMode mode) {
    switch(widget.config.mode){
      case FlutterMode.up_down:
        return UpDownAnim(
          animation: animation,
          child: widget.child,
        );
      case FlutterMode.left_right:
        return LeftRightAnim(
          animation: animation,
          child: widget.child,
        );
      case FlutterMode.swing:
        return SwingAnim(
          animation: animation,
          child: widget.child,
        );
      case FlutterMode.random:
        return RandomAnim(
          animation: animation,
          child: widget.child,
        );
        break;
    }
  }
}

class SwingAnim extends AnimatedWidget {
  SwingAnim({Key key, Animation<double> animation, this.child})
      : super(key: key, listenable: animation);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    var result = Transform(
      transform: Matrix4.rotationZ(animation.value * pi / 180),
      alignment: Alignment.center,
      child: child,
    );
    return result;
  }
}

///随机动画
class RandomAnim extends AnimatedWidget {
  RandomAnim({Key key, Animation<double> animation, this.child})
      : super(key: key, listenable: animation){
    random = Random();
    var widgets=[UpDownAnim(animation: listenable, child: child,),
      LeftRightAnim(animation: listenable, child: child,),
      SwingAnim(animation: listenable, child: child,)];
    reslut=widgets[random.nextInt(widgets.length)];
  }
  Random random;
  final Widget child;
var reslut;
  @override
  Widget build(BuildContext context) {

    return reslut ;
  }
}

class LeftRightAnim extends AnimatedWidget {
  LeftRightAnim({Key key, Animation<double> animation, this.child})
      : super(key: key, listenable: animation){
     random = Random();
  }
  Random random;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    var result = Transform(
      transform: Matrix4.translationValues(animation.value*pow(-1, random.nextInt(20)), 0, 0),
      alignment: Alignment.center,
      child: child,
    );
    return result;
  }
}

class UpDownAnim extends AnimatedWidget {
  UpDownAnim({Key key, Animation<double> animation, this.child})
      : super(key: key, listenable: animation){
    random = Random();
  }
  Random random;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    var result = Transform(
      transform: Matrix4.translationValues(0, animation.value*pow(-1, random.nextInt(20)), 0),
      alignment: Alignment.center,
      child: child,
    );
    return result;
  }
}
