import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollTest extends StatefulWidget {
  ScrollTest({
    Key key,
  }) : super(key: key);

  @override
  _ScrollTestState createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  ScrollController _ctrl;


  var rainbow = [
    //颜色列表
    0xffff0000, 0xffFF7F00, 0xffFFFF00,
    0xff00FF00, 0xff00FFFF, 0xff0000FF, 0xff8B00FF
  ];

  @override
  void initState() {
    //通常可滚动组件的子组件可能会非常多、占用的总高度也会非常大；如果要一次性将子组件全部构建出将会非常昂贵！为此，Flutter中提出一个Sliver（中文为“薄片”的意思）概念，如果一个可滚动组件支持Sliver模型，那么该滚动可以将子组件分成好多个“薄片”（Sliver），只有当Sliver出现在视口中时才会去构建它，这种模型也称为“基于Sliver的延迟构建模型”。可滚动组件中有很多都支持基于Sliver的延迟构建模型，如ListView、GridView，但是也有不支持该模型的，如SingleChildScrollView。
    _ctrl=ScrollController(
      initialScrollOffset: 10//初识偏移
    )..addListener((){
      var min=_ctrl.position.minScrollExtent; //可滑动的最大小值
      var max=_ctrl.position.maxScrollExtent; //可滑动的最大值
      print('---Extent:----$min-------$max----');

      var axis=_ctrl.position.axis; //滑动的轴向
      print('---axis:----$axis-----------');
      var pixels=_ctrl.position.pixels;//顶部距离父容器的高度(已滑动了多少)
      print('---pixels:----$pixels-----------');

      var atEdge=_ctrl.position.atEdge;//是否滑到顶或底  可和下面的属性结合使用
      var direction=_ctrl.position.userScrollDirection;//向上ScrollDirection.forward
      print('---atEdge:----$atEdge-----Direction:-----$direction-----');

      var dimension=_ctrl.position.viewportDimension;//滑动区域大小
      print('---dimension:----$dimension----------');

      if(direction==ScrollDirection.forward&&atEdge){//滑到头
        _ctrl.animateTo(max, duration: Duration(seconds: 2), curve: Curves.bounceOut);
      }


      if(direction==ScrollDirection.reverse&&atEdge){
        _ctrl.animateTo(min, duration: Duration(seconds: 2), curve: Curves.bounceOut);
      }

//      if(pixels>50){
//        _ctrl.animateTo(max, duration: Duration(seconds: 5), curve: Curves.linear);
//      }
    });
    super.initState();
  }
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var items=Column(//颜色条
      children: rainbow
          .map((color) => Container(
        height: 50,
        width: 300,
        color: Color(color),
      ))
          .toList(),
    );

    var scroll= SingleChildScrollView(
        controller: _ctrl,

//      scrollDirection: Axis.horizontal,
//        reverse: true,
//        padding: EdgeInsets.all(10),
        child: items);

    return Container(
      padding: EdgeInsets.all(8),
      width: 400,
      height: 200,
      color: Colors.grey.withAlpha(44),
      child:scroll,
    );
  }
}
