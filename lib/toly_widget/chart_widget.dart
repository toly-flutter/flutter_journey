import 'package:flutter/material.dart';
import '../toly_widget/circle_image.dart';


class NinePointBox extends StatelessWidget {
  final ImageProvider image;
  final Widget child;
  final Rect sliceRect;
  final double maxWith;
  final EdgeInsetsGeometry padding;

  NinePointBox(
      {Key key,
      @required this.image,
      this.child,
      @required this.sliceRect,
      this.maxWith = 280,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          centerSlice: this.sliceRect,
          image: image,
        ),
      ),
      constraints: BoxConstraints(maxWidth: this.maxWith),
      padding: padding,
      child: child,
    );
  }
}

enum ChartType { right, left }//组件的类型

class ChatItem {//组件信息描述类
  ImageProvider headIcon;//头像
  double maxWith;//最大宽
  ChartType type;//组件的类型
  String text;//文字信息

  ChatItem(
      {this.headIcon,
        this.text,
        this.maxWith = 300,
        this.type = ChartType.right});
}

class ChatWidget extends StatelessWidget {
  final ChatItem chartItem;

  ChatWidget({Key key, this.chartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (chartItem.type) {//根据类型返回不同的组件
      case ChartType.right:
        return _buildRight();//创建头像在右侧的组件
        break;
      case ChartType.left://创建头像在左侧的组件
        return _buildLeft();
        break;
    }
  }

  Widget _buildRight() {
    var head = Padding(
      padding: EdgeInsets.only(left: 10, right: 20,),
      child: CircleImage(image: chartItem.headIcon,),
    );

    var box = NinePointBox(
      sliceRect: Rect.fromLTRB(18, 24, 65, 25),
      padding: EdgeInsets.fromLTRB(15, 10, 20, 10.0),
      image: AssetImage('images/right_chat.png',),
      child: Text(chartItem.text,
        style: TextStyle(fontSize: 15.0),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[box, head],
      ),
    );
  }

  Widget _buildLeft() {
    var head = Padding(
      padding: EdgeInsets.only(right: 10, left: 20,),
      child: CircleImage(image: chartItem.headIcon,),
    );

    var box = NinePointBox(
      sliceRect: Rect.fromLTRB(28, 26, 59, 27),
      padding: EdgeInsets.fromLTRB(20, 10, 10, 10.0),
      image: AssetImage('images/left_chat.png',),
      child: Text(chartItem.text,
        style: TextStyle(fontSize: 15.0),
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[head, box,],
      ),
    );
  }
}

////----------测试 ---------------
var right = ChatWidget(
  chartItem: ChatItem(
      headIcon: AssetImage("images/icon_head.png"),
      type: ChartType.right,
      text: "凭君莫话封侯事，一将功成万骨枯。你觉得如何?"),
);

var left = ChatWidget(
  chartItem: ChatItem(
      headIcon: AssetImage("images/wy_200x300.jpg"),
      type: ChartType.left,
      text: "在苍茫的大海上，狂风卷积着乌云，在乌云和大海之间，海燕像黑色的闪电，在高傲的飞翔。"),
);

var show = Column(
  children: <Widget>[right, left],
);
