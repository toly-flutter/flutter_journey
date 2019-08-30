import 'package:flutter/material.dart';

class MultiShower extends StatelessWidget {
  MultiShower(
    this.list,
    this.call, {
    this.width = 110,
    this.height = 110 * 0.618,
    this.infos,
    this.color = Colors.cyanAccent,
  });

  final List list;//数据
  final List<String> infos;//底部介绍
  final Function call;//回调
  final double width;//单体宽
  final double height;//单体高
  final Color color;//颜色

  @override
  Widget build(BuildContext context) {
    int i = -1;
    var item=Center(
      child: Wrap(
        children: list.map((e) {
          i++;
          return  Column(
                children: <Widget>[
                  Card(
                    child: Container(
                        margin: EdgeInsets.all(5),
                        color: color,
                        width: width,
                        height: height,
                        child: call(list[i])),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(infos != null
                          ? infos[i]
                          : list[i].toString().split(".")[1]))
                ],
              );
        }).toList(),
      ),
    );
    return SingleChildScrollView(child: item);
  }
}

///------------测试 ---------
///
var show = MultiShower(
  BlendMode.values,
      (mode) => Image(
    image: AssetImage("images/icon_head.png"),
    color: Colors.blue,
    colorBlendMode: mode,
  ),
  width: 56,
  height: 56,
);
