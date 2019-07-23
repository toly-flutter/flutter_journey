import 'package:flutter/material.dart';
import 'package:flutter_journey/day5/user_panel.dart';

import 'article_panel.dart';
import 'item_chart.dart';

showUserPanel() {
  var show = UserPanel(
    onHeadTap: () {
      print("----------------");
    },
    onEditTap: (user) {
      print("----------------user:${user.name}");
    },
    user: User(
        name: "Toly",
        lever: 4,
        company: "捷特王国",
        position: "编程之王",
        proverbs: "海的彼岸有我未曾见证的风采666666666",
        image: Image.asset(
//头像
          "images/icon_head.png",
        )),
  );
  return show;
}

showItemChart() {
  show = ItemChart(
    onTap: (bean) {
      print(bean.name);
    },
    chartBean: ChartBean(
        name: "张风捷特烈",
        sentence: "我是要成为编程之王的男人。你要不要成为编程之王的女人?",
        time: "08:30",
        shield: false,
        image: Image.asset(
          "images/icon_head.png",
        )),
  );
  return show;
}

showItem() {
  var show = ArticlePanel(
    article: ArticleBean(
        userName: "张风捷特烈00",
        title: "[Flutter必备]-Flex布局完全解读",
        info: "也就是水平排放还是竖直排放，可以看出默认情况下都是主轴顶头,"
            "交叉轴居中比如horizontal下主轴为水平轴，交叉轴则为竖直。也就是水平顶头，竖直居中"
            "这里使用MultiShower快速展示,更好的对比出不同之处",
        type: "Flutter/Dart",
        starCount: "2000",
        commentCount: "3000",
        userIcon: Image.asset("images/icon_head.png"),
        cover: Image.asset("images/wy_300x200.jpg", fit: BoxFit.cover)),
    onTap: (bean) {
      print(bean.userName);
    },
  );

  return show;
}

var show = showItem();
