import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/day3/stateless_widget/rich_text.dart';
import 'package:flutter_journey/day3/toly_widget/poem_item_widget.dart';
import 'package:flutter_journey/day5/material_show/pop_menu.dart';

class CustomScrollViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bar = SliverAppBar(
      pinned: true,
      snap: true,
      //是否固定在顶部
      floating: true,
      primary: true,
      //是否预留高度,
      elevation: 10,
      //Bar下方阴影
      leading: Icon(Icons.language),
      //左侧图标
      expandedHeight: 190.0,
      //bar展开时大小
      actions: <Widget>[PopMenu()],
      //右侧
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        titlePadding: EdgeInsets.only(left: 45, bottom: 12), //标题边距
        collapseMode: CollapseMode.parallax, //视差效果
        title: const Text(
          '世界设计师',
          style: TextStyle(color: Colors.black, //标题
              shadows: [
                Shadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 2)
              ]),
        ),
        background: Image.asset(
          //背景
          "images/caver.jpeg", fit: BoxFit.cover,
        ),
      ),
    );

    var caverTextStyle = TextStyle(
        fontSize: 18,
        shadows: [Shadow(color: Colors.white, offset: Offset(1, 1))]);

    var header = SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 40.0,
          maxHeight: 100.0,
          child: Container(
            color: Color(0xffcca4ff),
            child: Center(
              child: Text('袅缈岁月，青丝银发', style: caverTextStyle),
            ),
          )),
    );

    var header2 = SliverPersistentHeader(
      floating: false, //floating 与pinned 不能同时为true
      pinned: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 40.0,
          maxHeight: 100.0,
          child: Container(color: Color(0xffe7fcc9),
            child: Center(child: Text('以梦为马，不负韶华', style: caverTextStyle,),),
          )),
    );

    var sliverGridCount = SliverGrid.count(
      childAspectRatio: 1 / 0.618,
      crossAxisCount: 4,
      children: List.generate(8, (i) => i)
          .map((e) => Card(
                child: Container(
                  alignment: Alignment.center,
                  color: randomColor(),
                  child: Text("$e"),
                ),
              ))
          .toList(),
    );

    var sliverGridExtent = SliverGrid.extent(
      childAspectRatio: 1 / 0.618,
      maxCrossAxisExtent: 80,
      children: List.generate(10, (i) => i)
          .map((e) => Card(
                child: Container(
                  alignment: Alignment.center,
                  color: randomColor(),
                  child: Text("$e"),
                ),
              ))
          .toList(),
    );

    var list = SliverFixedExtentList(
      itemExtent: 60,
      delegate: SliverChildBuilderDelegate(
          (_, int index) => Card(
                margin: EdgeInsets.all(2),
                child: Container(
                  alignment: Alignment.center,
                  color: randomColor(),
                  child: Text('list $index'),
                ),
              ),
          childCount: 50 //50个列表项
          ),
    );

    var adapter = SliverToBoxAdapter(
      child: PoemItemWidget(
        data: PoemItem(
            isCard: false,
            image: AssetImage("images/wy_200x300.jpg"),
            title: "以梦为马",
            author: "海子",
            summary: "我要做远方的忠诚的儿子，和物质的短暂情人，和所有以梦为马的诗人一样，我不得不和烈士和小丑走在同一道路上"),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
//        anchor: 0.2,
        scrollDirection: Axis.vertical,
        slivers: <Widget>[bar, header, sliverGridExtent, adapter, header2, sliverGridCount, list],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget child; //孩子

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override //是否需要重建
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
