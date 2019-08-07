import 'package:flutter/material.dart';

class SwitchTest extends StatefulWidget {
  @override
  _SwitchTestState createState() => _SwitchTestState();
}

class _SwitchTestState extends State<SwitchTest> {
  bool _checked=false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: _checked,
        activeColor: Colors.yellow,//选中状态颜色
        activeTrackColor: Colors.red,//选中状态圆角矩形颜色
        inactiveThumbColor: Colors.green,//未选中状态颜色
        inactiveTrackColor: Colors.blue,//未选中状态圆角矩形颜色
        onChanged: (checked) {
          setState(() {
            _checked = checked;
          });
        });
  }
}

var show = SwitchTest();


