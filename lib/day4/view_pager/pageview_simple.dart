import 'dart:math';

import 'package:flutter/material.dart';

class PageViewSimple extends StatefulWidget {
  PageViewSimple({this.height,this.width});
  final double height;//组件高
  final double width;//组件宽

  @override
  _PageViewSimpleState createState() => _PageViewSimpleState();
}

class _PageViewSimpleState extends State<PageViewSimple> {
  var width;
  var height;
  List<Color> _colors;

  @override
  void initState() {
    _colors = [Colors.red, Colors.yellow, Colors.blue,
      Colors.green, Colors.black];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width= widget.width??MediaQuery.of(context).size.width;//宽不设置默认为屏宽
    height=widget.height??120.0;//高不设置默认为120
    return Container(

      width: width,
      height: height,
      child: PageView.builder(//使用PageView
          scrollDirection: Axis.horizontal,//滑动方向
          itemCount: _colors.length,//条目个数
          itemBuilder: (ctx, i) => buildChild(_colors, i)//创建条目
      ),
    );
  }

  ///创建item
  Widget buildChild(List<Color> colors, int index) {
    var result=Container(
      alignment: Alignment.center,
      color: colors[index],
      child: Text("第$index页",
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
    return result;
  }
}
