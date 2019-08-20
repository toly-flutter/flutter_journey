import 'package:flutter/material.dart';
import 'package:flutter_journey/day6/life/red_page.dart';
import 'package:flutter_journey/day6/life/yellow_page.dart';

class LifePage extends StatelessWidget {
  LifePage({Key key}) : super(key: key);

  final TABS = ["红色", "黄色"];

  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(//标签
      isScrollable: true,
      labelStyle: TextStyle(fontSize: 14),
      labelColor: Color(0xffffffff),
      unselectedLabelColor: Color(0xffeeeeee),
      tabs: TABS.map((tab) {
        return Container(
          alignment: AlignmentDirectional.center,
          child: Text(tab),
          height: 40,
        );
      }).toList(),
    );

    var tabBarView = TabBarView(//页面
      children: TABS.map((text) {
        return _buildCenter(TABS.indexOf(text));
      }).toList(),
    );

    var scaffold = Scaffold(//脚手架
      appBar: AppBar(
        title: Text('State生命周期'),
        bottom: tabBar,
      ),
      body: Builder(builder: (context) {
        return tabBarView;
      }),
    );

    var homePage = MaterialApp(
      title: 'Flutter Unit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(//头部标签容器
          child: scaffold,
          length: TABS.length),
    );
    return homePage;
  }

  Widget _buildCenter(int index) {//标签跳转
    switch (index) {
      case 0:
        return RedPage();
      case 1:
        return YellowPage();
    }
  }
}
