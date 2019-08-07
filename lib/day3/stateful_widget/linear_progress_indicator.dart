import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class ProgressTest extends StatefulWidget {
  @override
  _ProgressTestState createState() => _ProgressTestState();
}

class _ProgressTestState extends State<ProgressTest> with TickerProviderStateMixin{

  AnimationController controller;

  Animation<double> animation;

  double _progress=0.0;
  @override
  void initState() {
    super.initState();


    controller = AnimationController(
      ////创建 Animation对象
        duration: Duration(milliseconds: 10000), //时长
        vsync: this);

    var curveTween = CurveTween(curve:Cubic(0.96, 0.13, 0.1, 1.2));//创建curveTween
    var tween=Tween(begin: 0.0, end: 1.0);
    animation = tween.animate(curveTween.animate(controller));


    animation.addListener(() {
      setState(() {
        _progress = animation.value;
      });
    });
    controller.forward();
//    colorController.forward();

  }


  @override
  Widget build(BuildContext context) {


    var show = Container(
      width: 200,
      height: 200,
      child: LinearProgressIndicator(value: _progress,valueColor:ColorTween(begin: Colors.red,end: Colors.blue).animate(AnimationController(
          duration: Duration(milliseconds: 1000), //时长
          vsync: this)),),
    );

    return show;
  }
}


var show =ProgressTest();



