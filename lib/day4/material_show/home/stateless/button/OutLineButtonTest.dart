import 'package:flutter/material.dart';

class OutLineButtonTest extends StatelessWidget {
  OutLineButtonTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var outLineButton = OutlineButton(//边线按钮
      onPressed: () {},
      child: Text("outLine"),
      color: Color(0xffF88B0A),
      highlightColor: Colors.blue,
      textColor: Color(0xff000000),
      borderSide: BorderSide(color: Color(0xff0A66F8), width: 2),
    );
    return outLineButton;
  }
}
