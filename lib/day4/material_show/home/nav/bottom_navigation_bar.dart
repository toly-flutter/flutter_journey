import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/cons.dart';

class BottomNavigationBarTest extends StatefulWidget {
  @override
  _BottomNavigationBarTestState createState() =>
      _BottomNavigationBarTestState();
}

class _BottomNavigationBarTestState extends State<BottomNavigationBarTest> {
  var _position = 0;

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(//底部栏
      items: Cons.ICONS_MAP.keys
          .map((key) => BottomNavigationBarItem(
              title: Text(key,),
              icon: Icon(Cons.ICONS_MAP[key]),
              backgroundColor: Colors.blue))
          .toList(),
      currentIndex: _position,
      onTap: (position) {
        _position = position;

        setState(() {});
      },
    );
    return bottomNavigationBar;
  }
}
