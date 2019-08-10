import 'package:flutter/material.dart';

class FlatButtonTest extends StatelessWidget {
  FlatButtonTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = FlatButton(//平按钮
      onPressed: () {},
      child: Text("flat"),
      textColor: Color(0xffFfffff),
      color: Colors.blue,
      highlightColor: Color(0xffF88B0A),
    );
    return result;
  }
}
