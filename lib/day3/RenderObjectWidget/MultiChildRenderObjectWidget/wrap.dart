import 'package:flutter/material.dart';

import 'indexed_stack.dart';

baseTest() {
  var wrap = Wrap(
      spacing: 8.0,
      // 列间距
      runSpacing: 4.0,
      //行间距
      direction: Axis.horizontal,
      //元素横向排列
      crossAxisAlignment: WrapCrossAlignment.start,
      children: <Widget>[
        getBox(30, Colors.red),
        getBox(60, Colors.yellow),
        getBox(70, Colors.green),
      ]);
  return wrap;
}

test() {
  var show = Wrap(
    spacing: 20.0,
    runSpacing: 8.0,
    crossAxisAlignment: WrapCrossAlignment.start,
    children: WrapCrossAlignment.values.map((e) {
      return Column(
        children: <Widget>[
      Container(
      color: Colors.black12,
        child:  Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              direction: Axis.horizontal,
              crossAxisAlignment: e,
              children: <Widget>[
                getBox(30, Colors.red),
                getBox(60, Colors.yellow),
                getBox(70, Colors.green),
              ])),
          Text(
            e.toString(),
          ),
        ],
      );
    }).toList(),
  );

  return Center(
    child: show,
  );
}

var show = test();
