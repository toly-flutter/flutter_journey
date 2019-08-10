import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/home/test.dart';
import 'package:flutter_journey/day4/material_show/side_widget.dart';
import 'package:flutter_journey/day4/material_show/sliver/cupertino_app.dart';
import 'package:flutter_journey/day4/material_show/sliver/material_app.dart' ;

import 'cons.dart';
import 'home/home_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _position = 0;
  Color _color=Colors.blue;
  Color _iconColor=Colors.white;
  Widget body;


  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(//底部栏
      items: Cons.ICONS_MAP.keys
          .map((key) => BottomNavigationBarItem(
          title: Text(key,),
          icon: Icon(Cons.ICONS_MAP[key],color:_iconColor ,),
          backgroundColor: _color))
          .toList(),
      currentIndex: _position,
      onTap: (position) {
        _position = position;
        body = _formBody(_position);
        setState(() {});
      },
    );

    var scaffold = Scaffold(
      //脚手架
      drawer: Drawer(elevation: 5, child: SideWidget()),
      endDrawer: Drawer(elevation: 5, child: SideWidget()),
      bottomNavigationBar: bottomNavigationBar,
      body: body ?? HomePage(),
    );

    var app = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: scaffold,
    );
    return app;
  }

  Widget _formBody(int position) {
    switch (position) {
      case 0:
        _color=Colors.blue;
        _iconColor=Colors.white;
        return HomePage();
      case 1:
        _color=Colors.blue;
        _iconColor=Colors.white;
        return ListAnimDemoPage();
      case 3:
        _color=Color(0xfff6f6f7);
        _iconColor=Colors.black;
        return MyCupertinoApp();
      case 4:
        _color=Color(0xffcdc5b1);
        _iconColor=Colors.white;
        return MyMaterialApp();
    }
  }
}
