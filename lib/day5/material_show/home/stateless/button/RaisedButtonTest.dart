import 'package:flutter/material.dart';

class RaisedButtonTest extends StatelessWidget {
  RaisedButtonTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var raisedButton = RaisedButton(//浮起按钮
      onPressed: () {},
      child: Text("raised",
        style: TextStyle(fontSize: 12),
      ),
      textColor: Color(0xffFfffff),//文字颜色
      color: Colors.blue,//按钮颜色
      highlightColor: Color(0xffF88B0A),//点击时颜色
    );

    return raisedButton;
  }
}
