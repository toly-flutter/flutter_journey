

import 'package:flutter/material.dart';
import 'package:flutter_journey/day7/key/swap_text_key_3.dart';

class GridViewExtent extends StatefulWidget {
  @override
  _GridViewGridViewExtentState createState() => _GridViewGridViewExtentState();
}

class _GridViewGridViewExtentState extends State<GridViewExtent> {
  List<int> data;

  @override
  void initState() {
    data=List.generate(50, (i)=>i);//生成50个数字
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   var extend= GridView.extent(
     padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,//滑动方向
      mainAxisSpacing: 10,//主轴间距
      crossAxisSpacing: 10,//交叉轴间距
      maxCrossAxisExtent: 130.0,
      childAspectRatio:1/0.618,//交叉轴方向item尺寸/主轴方向item尺寸
      children: data.map((e)=> Container(
        alignment: Alignment.center,
        color: randomColor(),child: Text("$e"),)).toList(),
    );
    return extend;
  }
}
