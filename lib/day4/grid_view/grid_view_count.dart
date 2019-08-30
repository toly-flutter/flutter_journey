

import 'package:flutter/material.dart';
import 'package:flutter_journey/day7/key/swap_text_key_3.dart';

class GridViewCount extends StatefulWidget {
  @override
  _GridViewCountState createState() => _GridViewCountState();
}

class _GridViewCountState extends State<GridViewCount> {
  List<int> data;
  @override
  void initState() {
    data=List.generate(50, (i)=>i);//生成50个数字
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var extend= GridView.count(
      crossAxisCount: 4,//条目个数
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,//滑动方向
      mainAxisSpacing: 10,//主轴间距
      crossAxisSpacing: 10,//交叉轴间距
      childAspectRatio:1/0.618,//交叉轴方向item尺寸/主轴方向item尺寸
      children: data.map((e)=>
          Container(
            alignment: Alignment.center,
            color: randomColor(),child: Text("$e"),)).toList(),
    );

    return extend;
  }
}