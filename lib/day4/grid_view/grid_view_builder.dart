

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/day7/key/swap_text_key_3.dart';

class GridViewBuilder extends StatefulWidget {
  @override
  _GridViewBuilderState createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  List<int> data;
  @override
  void initState() {
    data=List.generate(50, (i)=>i);//生成50个数字
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var extend= GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(//网格代理
        crossAxisCount: 2,//条目个数
        mainAxisSpacing: 10,//主轴间距
        crossAxisSpacing: 10,//交叉轴间距
        childAspectRatio:1/0.618,//交叉轴方向item尺寸/主轴方向item尺寸
      ),
      itemBuilder: (_, int position) {//创建item
        return Container(
            alignment: Alignment.center,
            color: randomColor(offsetA: 255),child: Text("$position"),
        );
      },
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,//滑动方向
    );
    return extend;
  }
}