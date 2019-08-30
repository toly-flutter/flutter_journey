import 'package:flutter/material.dart';
import 'package:flutter_journey/day5/material_show/home/stateless/button/flat_button.dart';
import 'package:flutter_journey/day5/material_show/home/stateless/button/OutLineButtonTest.dart';
import 'package:flutter_journey/day5/material_show/home/stateless/button/RaisedButtonTest.dart';

class ButtonBarTest extends StatelessWidget {
  ButtonBarTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var btnBar = ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[RaisedButtonTest(), FlatButtonTest(), OutLineButtonTest()],
    );
    return btnBar;
  }
}
