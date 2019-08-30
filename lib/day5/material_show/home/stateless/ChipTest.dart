import 'package:flutter/material.dart';

class ChipTest extends StatelessWidget {
  ChipTest({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    var chip = Chip(//图标
      backgroundColor: Color(0xffE5E5E5),//背景色
      padding: EdgeInsets.all(3),//内间距
      avatar: CircleAvatar(//圆形
          backgroundColor: Colors.lightBlue.shade400,//背景色
          child: new Text(//文字
            'Toly',
            style: TextStyle(fontSize: 10.0, color: Colors.white),
          )),
      label: Text('张风捷特烈'),
    );

    return chip;
  }

}