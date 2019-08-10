import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/home/stateless/button/CupertinoSegmentedControlTest.dart';

class StatefulShow extends StatefulWidget {
  @override
  _StatefulShowState createState() => _StatefulShowState();
}

class _StatefulShowState extends State<StatefulShow> {
  double _rad = 0.0;
  bool _checked = true;

  @override
  Widget build(BuildContext context) {


    var sliderWithLabel = Slider(//滑动条，有气泡标签
      value: _rad,//实际进度的位置
      label: 'value: $_rad',//显示的气泡标签
      min: 0.0,//最小值
      max: 360.0,//最大值
      divisions: 36,//分隔份数
      inactiveColor: Colors.black12,//非激活态颜色
      activeColor: Colors.blue,//激活态颜色
      onChanged: (double) {//拖动回调
        setState(() {
          _rad = double.roundToDouble();
        });
      },
    );

    var sliderNoLabel = Slider(
      value: _rad,
      inactiveColor: Colors.grey,
      min: 0.0,
      max: 360.0,
      activeColor: Colors.green,
      onChanged: (value) {
        setState(() {
          _rad = value;
        });
      },
    );
    var sliderCupertino = CupertinoSlider(//iOS滑动条
      value: _rad,
      min: 0.0,
      max: 360.0,
      activeColor: Colors.green,
      onChanged: (value) {
        _rad = value;
        setState(() {});
      },
    );

    var checkbox = Checkbox(//复选框
      value: _checked,//是否选择
      activeColor: Colors.blue,//激活态颜色
      onChanged: (value) {//状态切换回调
        _checked = value;
        setState(() {});
      },
    );

    var switcher = Switch(
      value: _checked,
      activeColor: Colors.black12,
      activeTrackColor: Colors.cyanAccent,
      activeThumbImage: AssetImage("images/icon_flutter.png"),
      onChanged: (bool value) {
        _checked = value;
        setState(() {});
      },
    );

    var rotate = Transform.rotate(//滑动进度条时旋转复选框
      angle: _rad / 180 * pi,
      child: switcher,
    );

    var switchCupertino = CupertinoSwitch(//iOS风格Switch
      value: _checked,
      activeColor: Colors.green,
      onChanged: (bool value) {
        _checked = value;
        setState(() {});
      },
    );

    var cupertinoActivityIndicator = CupertinoActivityIndicator(//iOS进度loading
      radius: 20,
      animating: !_checked,
    );
    var linearProgressIndicator = Container(//水平进度条
      height: 2,
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        value: _rad / 360,
      ),
    );

    var circularProgressIndicator = Container(//圆形进度条
      height: 40,
      width: 40,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        value: 1 - _rad / 360,
      ),
    );


    var numLi = [1, 2, 3, 4, 5];
    var rate = _rad / 360;
    var radios = Wrap(//按钮组
        children: numLi.map((i) {
      return Radio<int>(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: i,
        groupValue: (numLi.length * rate).ceil(),
        onChanged: (int value) {
          print(value);
          _rad = value / numLi.length * 360;
          setState(() {});
        },
      );
    }).toList());



    var show = Column(//拼合
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[linearProgressIndicator, sliderNoLabel, sliderWithLabel,
        Row(children: <Widget>[
          circularProgressIndicator, checkbox, rotate, radios
        ], mainAxisAlignment: MainAxisAlignment.spaceAround),
        Row(
          children: <Widget>[
            cupertinoActivityIndicator, sliderCupertino, switchCupertino,],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        CupertinoSegmentedControlTest(),
      ],
    );

    return show;
  }
}
