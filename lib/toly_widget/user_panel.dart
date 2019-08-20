import 'package:flutter/material.dart';

import 'circle_image.dart';

class UserPanel extends StatelessWidget {
  var titleTextStyle = TextStyle(//标题文字样式
      color: Colors.white,
      fontSize: 20,
      shadows: [Shadow(color: Colors.blue, offset: Offset(.5, -.5))]);

  var infoTextStyle =//介绍文字样式
      TextStyle(color: Color(0xff72777B), fontSize: 14, shadows: [
    Shadow(color: Colors.blue, offset: Offset(.2, .2), blurRadius: .2),
  ]);

  final User user;
  final HeadTapCallback onHeadTap;//点击事件
  UserPanel({this.user, this.onHeadTap});

  @override
  Widget build(BuildContext context) {
    var leverText = ClipRRect(//等级
      borderRadius: BorderRadius.circular(5),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4),
          color: Color(0xff34D19B),
          child: Text(
            "Lv${this.user.lever}",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 10,
            ),
          )),
    );

    var user = Row(//用户名
      children: <Widget>[
        Text(this.user.name, style: titleTextStyle,),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: leverText,
        )
      ],
    );

    var info = IconText(//信息
      text: "${this.user.position} | ${this.user.company}",
      style: infoTextStyle,
      icon: Icons.next_week,
      iconColor: Colors.white,
    );

    var proverbs = IconText(//箴言
      text: this.user.proverbs,
      style: infoTextStyle,
      icon: Icons.speaker_notes,
      iconColor: Colors.white,
    );

    var headIcon = InkWell(//头像
      child: CircleImage(
        image: this.user.image,
        shadowColor: Colors.blue,
      ),
      onTap: onHeadTap,
    );

    var center = Wrap(//拼合中间
      direction: Axis.vertical,
      spacing: 3,
      children: <Widget>[
        Container(child: user, margin: EdgeInsets.only(top: 15),),
        info,
        Container(
          constraints: BoxConstraints(maxWidth: 250),
          child: proverbs,
          margin: EdgeInsets.only(bottom: 10),
        ),
      ],
    );

    var map = {"文章": "127", "关注者": "7777", "关注了": "9", "沸点": "19", "赞": "134"};
    var bottom = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _buildChild(map),
    );

    var top = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: headIcon,
        ),
        Expanded(child: center),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );

    var div = Padding(padding: EdgeInsets.symmetric(horizontal: 10),
      child: Divider(color: Colors.white,),
    );

    var result = Card(
        color: Color(0xff24292e),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[top, div, bottom, SizedBox(height: 10,)],
        ));

    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        result,
        Padding(
          padding: EdgeInsets.only(right: 40, top: 20),
          child: Image(
            image: AssetImage("images/honor.png"),
            width: 40,
            height: 40,
          ),
        )
      ],
    );
  }
  /// 根据[map]构建底部栏
  _buildChild(Map<String, String> map) {
    var keys = map.keys.toList();
    return keys.map((key) {
      return Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text(key, style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(map[key], style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ]);
    }).toList();
  }
}

class IconText extends StatelessWidget {
  IconText(
      {Key key,
      @required this.text,
      @required this.icon,
      this.style,
      this.maxLines = 2,
      this.iconColor = Colors.black,
      this.gap = 5})
      : super(key: key);

  final String text;
  final TextStyle style;
  final double gap;
  final IconData icon;
  final Color iconColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    var span = TextSpan(
      children: <InlineSpan>[
        WidgetSpan(
            //使用WidgetSpan添加一个组件
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Padding(
              padding: EdgeInsets.only(right: gap),
              child: Icon(icon, color: iconColor, size: style.fontSize),
            )),
        TextSpan(
          text: text,
          style: this.style,
        ),
      ],
    );
    return RichText(
      text: span,
      maxLines: this.maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

typedef HeadTapCallback = void Function();

class User {
  String name; //名字
  int lever; //等级
  ImageProvider image; //头像
  String position; //职务
  String company; //公司
  String proverbs; //箴言
  User(
      {this.name="",
      this.lever=0,
      this.image,
      this.position="",
      this.company="",
      this.proverbs=""});

  User.fromMap(Map<String,dynamic> json){
    name=json["name"]??json["login"]??"未知";
    lever=json["public_repos"]??"未知";
    position=json["location"]??"未知";
    company=json["company"]??"未知";
    proverbs=json["bio"]??"不想告诉你";
    image=NetworkImage(json["avatar_url"]);
  }
}

var show = UserPanel(
  onHeadTap:(){

  },
  user: User(
      name: "张风捷特烈",
      lever: 4,
      company: "捷特王国",
      position: "编程之王",
      proverbs: "海的彼岸有我未曾见证的风采。",
      image: AssetImage(//头像
        "images/icon_head.png",
      )),
);
