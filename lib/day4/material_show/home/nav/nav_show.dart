import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/home/nav/AppBarTest.dart';
import 'package:flutter_journey/day4/material_show/home/nav/AppBottomBarTest.dart';
import 'package:flutter_journey/day4/material_show/home/nav/CupertinoTabBarTest.dart';
import 'package:flutter_journey/day4/material_show/home/nav/bottom_navigation_bar.dart';
import 'package:flutter_journey/day4/material_show/home/nav/CupertinoNavigationBarTest.dart';
class NavShow extends StatefulWidget {
  @override
  _NavShowState createState() => _NavShowState();
}

class _NavShowState extends State<NavShow> {
  @override
  Widget build(BuildContext context) {

    var show = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AppBarTest(),
        AppBottomBarTest(),

        CupertinoNavigationBarTest(),
        CupertinoTabBarTest(),

      ],

    );

    return show;
  }
}
