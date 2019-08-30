

import 'package:flutter/material.dart';
import 'package:flutter_journey/day7/key/swap_text_key_3.dart';

import '../item.dart';

class GridViewCustom extends StatefulWidget {
  @override
  _GridViewCustomState createState() => _GridViewCustomState();
}

class _GridViewCustomState extends State<GridViewCustom> {
  List<int> data;
  @override
  void initState() {
    data=List.generate(50, (i)=>i);//生成50个数字
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var extend= GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(//网格代理
        crossAxisCount: 2,//条目个数
        mainAxisSpacing: 10,//主轴间距
        crossAxisSpacing: 10,//交叉轴间距
        childAspectRatio:1/0.618,//交叉轴方向item尺寸/主轴方向item尺寸
      ),
      childrenDelegate: SliverChildBuilderDelegate((_, position) =>
        Container(
          alignment: Alignment.center,
          color: randomColor(),child: Text("$position"),)
        ,
        childCount: data.length,


      ),
     );

    return extend;
  }
}