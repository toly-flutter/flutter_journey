import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/cons.dart';

class CupertinoTabBarTest extends StatelessWidget {
  CupertinoTabBarTest({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {

    return CupertinoTabBar(
          items: Cons.ICONS_MAP.keys.toList().map((e){
            return BottomNavigationBarItem(
              icon: Icon(Cons.ICONS_MAP[e],),
              title: Text(e),
            );
          }).toList(),
          activeColor: Colors.blue,
          inactiveColor: Color(0xff333333),
          backgroundColor: Color(0xfff1f1f1),
          iconSize: 25.0,
    );
  }

}