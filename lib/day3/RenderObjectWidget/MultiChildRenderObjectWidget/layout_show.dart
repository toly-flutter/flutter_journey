import 'dart:math';

import 'package:flutter/material.dart';



var box50 = Container(
  //容器组件
  color: Colors.lightBlueAccent, //容器的颜色
  width: 50, //容器宽
  height: 50, //容器高
  child: Text("Container"), //容器内部组件
);

var row = Row(
//  crossAxisAlignment: CrossAxisAlignment.start,
//  mainAxisAlignment:MainAxisAlignment.start,
//    mainAxisSize:MainAxisSize.max,
  children: <Widget>[
    getBox(50, Colors.red),
    getBox(60, Colors.yellow),
    getBox(70, Colors.green),
  ],
);

var column = Column(
  children: <Widget>[
    getBox(50, Colors.red),
    getBox(60, Colors.yellow),
    getBox(70, Colors.green),
  ],
);

var stack = Stack(
  alignment: AlignmentDirectional.center, //对齐方式
  children: <Widget>[
    getBox(80, Colors.yellow),
    getBox(70, Colors.red),
    getBox(60, Colors.green),
    getBox(50, Colors.cyanAccent),
  ],
);

var indexStack = IndexedStack(
  index: 1, //显示索引为1的元素
  alignment: AlignmentDirectional.center, //对齐方式
  children: <Widget>[
    getBox(80, Colors.yellow),
    getBox(70, Colors.red),
    getBox(60, Colors.green),
    getBox(50, Colors.cyanAccent),
  ],
);

var wrap = Wrap(
    spacing: 8.0, // 列间距
    runSpacing: 4.0, //行间距
    direction: Axis.horizontal, //元素横向排列
    crossAxisAlignment: WrapCrossAlignment.start,
    children: <Widget>[
      getBox(50, Colors.red),
      getBox(60, Colors.yellow),
      getBox(70, Colors.green),
    ]);

var flow = Flow(
  delegate: MarginFlowDelegate(EdgeInsets.all(5)),
  children: getBoxes(5),
);

class MarginFlowDelegate extends FlowDelegate {
  EdgeInsets _margin = EdgeInsets.zero; //成员变量_margin
  MarginFlowDelegate(this._margin); //构造函数
  @override //绘制孩子的方法
  void paintChildren(FlowPaintingContext context) {
    var offsetX = _margin.left;
    var offsetY = _margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + offsetX + _margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX = w + _margin.left;
      } else {
        offsetX = _margin.left;
        offsetY +=
            context.getChildSize(i).height + _margin.top + _margin.bottom;
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX += context.getChildSize(i).width + _margin.left + _margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}

/// 获取一个方形盒子，其中边长是[width],颜色是[color]
Widget getBox(double width, Color color) => Container(
      //容器组件
      color: color, //容器的颜色
      width: width, //容器宽
      height: width, //容器高
    );

/// 批量获取宽度和颜色随机的[count]个盒子
List<Widget> getBoxes(int count) {
  var random = Random();
  var li = <Widget>[];
  for (int i = 0; i < count; i++) {
    li.add(Container(
      width: 100 * (random.nextDouble() + 0.3),
      height: 30,
      color: randomRGB(),
    ));
  }
  return li;
}

Color randomRGB() {
  Random random = Random();
  int r = 30 + random.nextInt(200);
  int g = 30 + random.nextInt(200);
  int b = 30 + random.nextInt(200);
  return Color.fromARGB(255, r, g, b);
}
