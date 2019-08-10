import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_journey/day4/material_show/home/input/input_show.dart';

class SideWidget extends StatefulWidget {
  @override
  _SideWidgetState createState() => _SideWidgetState();
}

class _SideWidgetState extends State<SideWidget> {
  @override
  Widget build(BuildContext context) {
    var top = Opacity(
      opacity: 0.8,
      child: Container(
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/wy_300x200_filter.jpg"),
                  fit: BoxFit.cover))),
    );

    var show = Column(
      children: <Widget>[
        top,
      ],
    );
    return show;
  }
}
