import 'package:flutter/material.dart';

class ChartBean {
  ImageProvider image; //头像
  String name; //名字
  String sentence; //句子
  String time; //时间
  bool shield; //是否屏蔽

  ChartBean(
      {this.image, this.name, this.sentence, this.time, this.shield = false});
}

typedef TapCallback = void Function(ChartBean bean);

class ChatListItem extends StatefulWidget {
  ChatListItem({Key key, this.chartBean, this.onTap}) : super(key: key);
  final TapCallback onTap;
  final ChartBean chartBean;

  @override
  _ChatListItemState createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  var nameTextStyle = TextStyle(color: Colors.black, fontSize: 16);
  var infoTextStyle = TextStyle(color: Color(0xff999999), fontSize: 12);
  bool _checked = false; //是否已查看

  @override
  Widget build(BuildContext context) {
    var left = Container(
      //左侧头像
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image(
          image: widget.chartBean.image,
          fit: BoxFit.cover,
        ),
      ),
      width: 50,
      height: 50,
    );

    var leftWrap = Stack(
      //使用Stack包裹小圆点和头像
      alignment: Alignment(1.2, -1.2),
      children: <Widget>[
        left,
        ClipOval(
          child: Container(
            width: 10,
            height: 10,
            color: Colors.red,
          ),
        )
      ],
    );

    var center = Column(
      //中间部分
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.chartBean.name, style: nameTextStyle),
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            widget.chartBean.sentence,
            style: infoTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );

    var right = Column(
      //右侧
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.chartBean.time, style: infoTextStyle),
        widget.chartBean.shield //这里使用shield属性控制是否显示屏蔽的图标
            ? Icon(
          Icons.visibility_off,
          size: 18,
          color: Color(0xff999999),
        )
            : Container(
          height: 18,
        )
      ],
    );
    var body = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: _checked ? left : leftWrap,
        ),
        Expanded(
          child: center,
        ),
        right
      ],
    );
    return InkWell(
      child: Container(child: body, padding: EdgeInsets.all(10)),
      onTap: () {
        _checked = true;
        if (widget.onTap != null) {
          widget.onTap(widget.chartBean);
        }
        setState(() {});
      },
    );
  }
}

//var show = ChatListItem(
//  chartBean: ChartBean(
//      name: "心如止水",
//      sentence: "在吗?小哥哥",
//      time: "06:45",
//      shield: true,
//      image: AssetImage("images/mani.jpg")),
//);

var show = ChatListItem(
    onTap: (bean) {
      print(bean.name);
    },
    chartBean: ChartBean(
        name: "张风捷特烈",
        sentence: "我是要成为编程之王的男人。你要不要成为编程之王的女人?",
        time: "08:30",
        shield: false,
        image: AssetImage("images/icon_head.png")));

///----------------------------
/// Panel
///----------------------------
///

