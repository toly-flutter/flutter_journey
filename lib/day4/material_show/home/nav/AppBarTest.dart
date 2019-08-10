import 'package:flutter/material.dart';
import 'package:flutter_journey/day4/material_show/pop_menu.dart';
import 'dart:ui';
// 默认 AppBar 的实例
// index 当前AppBar 的索引值

class AppBarTest extends StatefulWidget {
  AppBarTest({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppBarTestState();
}

// AppBar 默认的实例,有状态
class _AppBarTestState extends State with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6); // 和下面的 TabBar.tabs 数量对应
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 如果省略了 leading ，但 AppBar 在带有 Drawer 的 Scaffold 中，则会插入一个 button 以打开 Drawer。
    // 否则，如果最近的 Navigator 具有任何先前的 router ，则会插入BackButton。
    // 这种行为可以通过设置来关闭automaticallyImplyLeading 为false。在这种情况下，空的 leading widget 将导致 middle/title widget 拉伸开始。
    return Container(
      height: 180,

      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/wy_300x200_filter.jpg",),fit: BoxFit.cover)),
      child: AppBar(
        // 大量配置属性参考 SliverAppBar 示例
        title: Text('风雅六社'),
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.amber[500].withAlpha(33),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.star),
              tooltip: 'like',
              onPressed: () {
                // do nothing
              }),
          IconButton(
              icon: Icon(Icons.delete),
              tooltip: 'delete',
              onPressed: () {
                // do nothing
              }),
          PopMenu()
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.orangeAccent,
          tabs: <Widget>[
            Tab(text: "风画庭"),
            Tab(text: "雨韵舍"),
            Tab(text: "雷鸣殿"),
            Tab(text: "电疾堂"),
            Tab(text: "霜寒阁"),
            Tab(text: "雪月楼"),
          ],
        ),
      ),
    );
  }
}
