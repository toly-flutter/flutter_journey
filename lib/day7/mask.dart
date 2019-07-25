import 'package:flutter/material.dart';

class Mask extends StatefulWidget {
  Mask({Key key,this.on,this.child}):super(key:key);

  final Widget child;
  final Widget on;

  @override
  _MaskState createState() => _MaskState();
}

class _MaskState extends State<Mask> {
  @override
  Widget build(BuildContext context) {

    var son=
    Container(child: widget.child,color: Color(0x88000000),);

    return Stack(
      children: <Widget>[widget.on,son],
    );


  }
}
