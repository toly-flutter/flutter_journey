import 'package:flutter/material.dart';

class MdPanel extends StatelessWidget {
  MdPanel({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color(0xFFF6F8FA),
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}
