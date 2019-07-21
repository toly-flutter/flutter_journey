import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Matrix4Page extends StatefulWidget {
  Matrix4Page({this.child});

  final Widget child;

  _Matrix4PageState createState() => _Matrix4PageState();
}

class _Matrix4PageState extends State<Matrix4Page>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  var slider;

  initState() {
    super.initState();

    controller = AnimationController(//创建 Animation对象
        duration: const Duration(milliseconds: 2000), //时长
        vsync: this);

    var tween = Tween(begin: 0.0, end: 2.0); //创建从25到150变化的Animatable对象
    animation = tween.animate(controller); //执行animate方法，生成

    animation.addListener((){
        setState(() {

        });
    });

    controller.forward();
  }


  var a1=1.0,a2=0.0,a3=0.0,a4=0.0;
  var b1=0.0,b2=1.0,b3=0.0,b4=0.0;
  var c1=0.0,c2=0.0,c3=1.0,c4=0.0;
  var d1=0.0,d2=0.0,d3=0.0,d4=1.0;

  Widget build(BuildContext context) {
//    var matrix=Matrix4.rotationZ(animation.value / 180 * pi);

    var matrix= Matrix4.fromList(<double>[
      a1,a2,a3,a4,
      b1,b2,b3,b4,
      c1,c2,c3,c4,
      d1,d2,d3,d4,
    ]);

    var slider =Slider(value:a1,onChanged: (e){
      print(e);
        this.setState(() {
          this.a1 = e;
        });
    });



    var show = Transform(
      transform: matrix,
      transformHitTests: true,
      origin: Offset(0,0),
      alignment: Alignment.center,
      child: widget.child,
    );



    return Column(children: <Widget>[show,slider ],);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
