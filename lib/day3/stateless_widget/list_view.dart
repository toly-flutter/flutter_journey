import 'dart:math';

import 'package:flutter/material.dart';
import '../toly_widget/chart_widget.dart';
import '../toly_widget/poem_item_widget.dart';

base() {
  var caverStyle = TextStyle(fontSize: 18, shadows: [ //文字样式
    Shadow(color: Colors.white, offset: Offset(-0.5, 0.5), blurRadius: 0)
  ]);

  var show = ListView(
    //ListView的构造方法
    padding: EdgeInsets.all(8.0), //边距
    scrollDirection: Axis.horizontal,//水平的ListView
    children: <Widget>[
      //孩子们
      Container(height: 50, color: Color(0xffff0000),
        child: Center(
            child: Text('红色', style: caverStyle,)),
      ),
      Container(height: 50, color: Color(0xffFFFF00),
        child: Center(child: Text('黄色', style: caverStyle,)),
      ),
      Container(height: 50, color: Color(0xff00FF00),
        child: Center(child: Text('绿色', style: caverStyle,)),
      ),
      Container(height: 50, color: Color(0xff0000FF),
        child: Center(child: Text('蓝色', style: caverStyle,
        )),
      ),
    ],
  );

  return show;
}

builder() {
  const colorMap = { //数据来源
    0xffff0000: "红色", 0xffFFFF00: "黄色",
    0xff00FF00: "绿色", 0xff0000FF: "蓝色",
  };

  var caverStyle = TextStyle(fontSize: 18, shadows: [ //文字样式
    Shadow(color: Colors.white, offset: Offset(-0.5, 0.5), blurRadius: 0)
  ]);

  var show = ListView.builder(
      //使用builder方法进行构造
      padding: EdgeInsets.all(8.0),
      itemCount: colorMap.length, //条目的个数
      itemBuilder: (BuildContext context, int index) {
        //条目构造器
        return Container(
          height: 50,
          color: Color(colorMap.keys.toList()[index]),
          child: Center(
              child: Text(
            '${colorMap.values.toList()[index]}',
            style: caverStyle,
          )),
        );
      });

  return show;
}

separated() {
  const colorMap = {
    //数据来源
    0xffff0000: "红色",
    0xffFFFF00: "黄色",
    0xff00FF00: "绿色",
    0xff0000FF: "蓝色",
  };

  var caverStyle = TextStyle(fontSize: 18, shadows: [
    //文字样式
    Shadow(color: Colors.white, offset: Offset(-0.5, 0.5), blurRadius: 0)
  ]);

  var show = ListView.separated(
      //使用separated方法进行构造
      padding: EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        //条目构造器
        return Container(
          height: 50,
          color: Color(colorMap.keys.toList()[index]),
          child: Center(
              child: Text(
            '${colorMap.values.toList()[index]}',
            style: caverStyle,
          )),
        );
      },
      separatorBuilder: (context, index) {
        //分隔线构造器
        return Container();
      },
      itemCount: colorMap.length);

  return show;
}

poemBuilder() {
  var data = <PoemItem>[];
  for (var i = 0; i < 20; i++) {//模拟数据
    data.add(PoemItem(
        image: AssetImage("images/wy_200x300.jpg"),
        title: "$i:以梦为马",
        author: "海子",
        isCard: false,
        summary: "我要做远方的忠诚的儿子，和物质的短暂情人，和所有以梦为马的诗人一样，"
            "我不得不和烈士和小丑走在同一道路上"));
  }

  var show = ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: data.length, //条目的个数
      itemBuilder: (BuildContext context, int index) {
        return PoemItemWidget(//数据填充条目
          data: data[index],

        );
      });

  return show;
}

separatedBuilder() {
  var data = <PoemItem>[];
  for (var i = 0; i < 20; i++) {
    data.add(PoemItem(
        image: AssetImage("images/wy_200x300.jpg"),
        title: "$i:以梦为马",
        author: "海子",
        summary: "我要做远方的忠诚的儿子，和物质的短暂情人，和所有以梦为马的诗人一样，我不得不和烈士和小丑走在同一道路上"));
  }

  var show = ListView.separated(
    padding: EdgeInsets.all(8.0),
    itemCount: data.length, //条目的个数
    itemBuilder: (BuildContext context, int index) {
      return PoemItemWidget(
        //数据填充条目
        data: data[index],
//        onItemClickListener: () {
//          //事件响应
//          print(index);
//        },
      );
    },
    separatorBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.only(left: 90),
        child: Divider(
          height: 1,
          color: Colors.orangeAccent,
        ),
      );
    },
  );
  return show;
}

builder4() {
  var random = Random();
  var data = <ChatItem>[];
  var strs = [
    "我是要成为编程之王的男人，你是要成为编程之王的女人",
    "凭君莫话封侯事，一将功成万骨枯。你觉得如何?",
    "识君，吾之幸也;失君，物质憾也;守君，吾之愿也。",
    "简单必有简单的成本，复杂必有复杂的价值。"
  ];

  for (var i = 0; i < 20; i++) {
    data.add(ChatItem(
        headIcon: AssetImage(
            i.isEven ? "images/wy_200x300.jpg" : "images/icon_head.png"),
        text: strs[random.nextInt(strs.length)],
        type: i.isEven ? ChartType.left : ChartType.right));
  }

  var show = ListView.builder(
    itemCount: data.length, //条目的个数
    itemBuilder: (BuildContext context, int index) {
      return ChatWidget(
        //数据填充条目
        chartItem: data[index],
      );
    },
  );
  return RefreshIndicator(
    child: show,
    onRefresh: () {
      print("onRefresh");
    },
  );
}

builder5() {
  var random = Random();
  var data = <ChatItem>[];

  var strs = [
    "我是要成为编程之王的男人，你是要成为编程之王的女人",
    "凭君莫话封侯事，一将功成万骨枯。你觉得如何?",
    "在苍茫的大海上，狂风卷积着乌云，在乌云和大海之间，海燕像黑色的闪电，在高傲的飞翔。"
  ];

  for (var i = 0; i < 20; i++) {
    data.add(ChatItem(
        headIcon: AssetImage(
            i.isEven ? "images/wy_200x300.jpg" : "images/icon_head.png"),
        text: strs[random.nextInt(strs.length)],
        type: i.isEven ? ChartType.left : ChartType.right));
  }

  var show = ListView.builder(
    physics: AlwaysScrollableScrollPhysics(),
    itemCount: data.length, //条目的个数
    itemBuilder: (BuildContext context, int index) {
      return ChatWidget(chartItem: data[index],
      );
    },
  );
  return show;
}

var show = builder4();

//typedef OnItemClickListener = void Function();
//
//class PoemItemView extends StatelessWidget {
//  final PoemItem data;
//  final OnItemClickListener onItemClickListener;
//
//  PoemItemView({Key key, this.data, this.onItemClickListener})
//      : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    var headIcon = Container(
//        //左边头部
//        decoration: BoxDecoration(
//          color: Colors.white,
//          shape: BoxShape.circle,
//          boxShadow: [
//            BoxShadow(
//              color: Colors.grey.withOpacity(0.3),
//              offset: Offset(0.0, 0.0),
//              blurRadius: 3.0,
//              spreadRadius: 0.0,
//            ),
//          ],
//        ),
//        width: 70,
//        height: 70,
//        child: Padding(
//          padding: EdgeInsets.all(3),
//          child: CircleAvatar(
//            backgroundImage: data.image,
//          ),
//        ));
//
//    var center = Column(
//      //中间介绍
//      mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Text(data.title,
//            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//        Padding(
//          padding: EdgeInsets.only(top: 8),
//          child: Text(
//            "作者:${data.author}",
//            style: TextStyle(color: Colors.grey, fontSize: 12),
//          ),
//        ),
//      ],
//    );
//
//    var summary = Text(
//      //尾部摘要
//      data.summary,
//      maxLines: 3,
//      overflow: TextOverflow.ellipsis,
//      style: TextStyle(color: Colors.grey, fontSize: 12),
//    );
//
//    var item = Row(
//      //条目拼合
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: <Widget>[
//        SizedBox(width: 10),
//        headIcon,
//        Padding(
//          padding: EdgeInsets.symmetric(horizontal: 20),
//          child: center,
//        ),
//        Expanded(
//          child: summary,
//        ),
//        SizedBox(width: 10),
//      ],
//    );
//    var result = Card(
//        //卡片化+事件监听
//        elevation: 5,
//        child: InkWell(
//            onTap: onItemClickListener,
//            child: Padding(
//              padding: EdgeInsets.all(10),
//              child: item,
//            )));
//
//    return InkWell(
//        onTap: onItemClickListener,
//        child: Padding(
//          padding: EdgeInsets.all(10),
//          child: item,
//        ));
//  }
//}

//class PoemItem {
//  ImageProvider image; //图片
//  var title; //标题
//  var author; //作者
//  var summary; //摘要
//  PoemItem({this.image, this.title, this.author, this.summary});
//}

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
//      print(
//          "滑动了：${_scrollController.position.pixels},离顶部高：${_scrollController.position.maxScrollExtent}");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var random = Random();
    var data = <ChatItem>[];
    var strs = [
      "我是要成为编程之王的男人，你是要成为编程之王的女人",
      "凭君莫话封侯事，一将功成万骨枯。你觉得如何?",
      "在苍茫的大海上，狂风卷积着乌云，在乌云和大海之间，海燕像黑色的闪电，在高傲的飞翔。"
    ];

    for (var i = 0; i < 20; i++) {
      data.add(ChatItem(
          headIcon: AssetImage(
              i.isEven ? "images/wy_200x300.jpg" : "images/icon_head.png"),
          text: strs[random.nextInt(strs.length)],
          type: i.isEven ? ChartType.left : ChartType.right));
    }

    var show = ListView.builder(
        physics: new BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: data.length + 1, //条目的个数
        itemBuilder: (BuildContext context, int index) {
          if (index == data.length) {
            return Offstage(
                offstage: isLoaded,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
          } else {
            return ChatWidget(
              //数据填充条目
              chartItem: data[index],
            );
          }
        });
    return RefreshIndicator(child: show, onRefresh: _onRefresh);
  }

  Future<void> _onRefresh() async {//下拉刷新
    if (isLoading) {
      return;
    }
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> _loadMore() async {
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoaded = true;
      });
    });
  }
}



