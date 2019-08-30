import 'package:flutter/material.dart';
import 'package:flutter_journey/day5/material_show/home/dialog/dialog_show.dart';
import 'package:flutter_journey/day5/material_show/home/nav/nav_show.dart';
import 'package:flutter_journey/day5/material_show/home/stateful/stateful.dart';
import 'package:flutter_journey/day5/material_show/home/stateless/stateless.dart';

import '../cons.dart';
import '../pop_menu.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(
      //头部标签
      labelStyle: TextStyle(fontSize: 14), //字号
      labelColor: Color(0xffffffff), //当前选中文字颜色
      unselectedLabelColor: Color(0xffeeeeee), //未选中文字颜色
      tabs: Cons.TABS.map((tab) {
        //标签Widget
        return Container(
          alignment: AlignmentDirectional.center,
          child: Text(tab),
          height: 40,
        );
      }).toList(),
    );

    var tabBarView = TabBarView(
      //主页面们
      children: Cons.TABS.map((text) {
        return _buildCenter(Cons.TABS.indexOf(text));
      }).toList(),
    );

    var scaffold = Scaffold(
      //脚手架
      appBar: AppBar(
        title: Text('Flutter之旅'),
        bottom: tabBar,
        actions: <Widget>[PopMenu()],
      ),
      body: Builder(builder: (context) {
        return tabBarView;
      }),
    );

    var homePage = MaterialApp(
      title: 'Flutter Unit', //设备用于为用户识别应用程序的单行描述
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          //头部标签容器
          child: scaffold,
          length: Cons.TABS.length),
    );
    return homePage;
  }

  Widget _buildCenter(int index) {
    switch (index) {
      case 0:
        return StatefulShow();
      case 1:
        return StatelessShow();
      case 2:
        return DialogShow();
      case 3:
        return NavShow();
    }
  }
}
