import 'package:flutter/material.dart';

class UserPanel extends StatelessWidget {
  var titleTextStyle = TextStyle(color: Colors.black, fontSize: 20);
  var infoTextStyle = TextStyle(color: Color(0xff72777B), fontSize: 14);

  final User user;
  final HeadTapCallback onHeadTap;
  final EditTapCallback onEditTap;

  UserPanel({
    this.user,this.onHeadTap,this.onEditTap});

  @override
  Widget build(BuildContext context) {
    var user = Row(
      children: <Widget>[
        Text(
          this.user.name,
          style: titleTextStyle,
        ),
        ClipRRect(
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
        )
      ],
    );

    var info = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 5),
          child: Icon(Icons.next_week, size: 15),
        ),
        Text(
          "${this.user.position} | ${this.user.company}",
          style: infoTextStyle,
        )
      ],
    );

    var say = Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 5),
          child: Icon(Icons.keyboard, size: 15),
        ),
        Expanded(
            child: Text(this.user.proverbs, style: infoTextStyle))
      ],
    );

    var left = InkWell(
        child: ClipOval(
            child: Container(
              width: 50,
              height: 50,
              child: this.user.image,
            )),
        onTap:onHeadTap,
    );

    var center = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: user,
          margin: EdgeInsets.only(top: 10),
        ),
        info,
        Container(
          child: say,
          margin: EdgeInsets.only(bottom: 10),
        ),
      ],
    );

    var right = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.language,
              size: 18,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.local_pharmacy, size: 18)),
            Icon(Icons.person_pin_circle, size: 18)
          ],
        ),
        OutlineButton(
          onPressed: (){
            if (onEditTap!=null) {
              onEditTap(this.user);
            }
          },
          child: Text(
            "编辑资料",
            style: TextStyle(fontSize: 11),
          ),
          textTheme: ButtonTextTheme.primary,
          borderSide: BorderSide(color: Color(0xff6F80F7), width: 1),
        ),
      ],
    );

    var result = Card(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: left,
            ),
            Expanded(child: center),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: right,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ));
    return result;
  }
}

typedef HeadTapCallback = void Function();
typedef EditTapCallback = void Function(User user);

class User {
  String name; //名字
  int lever; //等级
  Image image; //头像
  String position; //职务
  String company; //公司
  String proverbs; //箴言
  User({this.name,
    this.lever,
    this.image,
    this.position,
    this.company,
    this.proverbs});
}


