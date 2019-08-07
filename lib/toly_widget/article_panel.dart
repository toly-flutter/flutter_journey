import 'package:flutter/material.dart';

class ArticlePanel extends StatelessWidget {
  ArticlePanel({Key key, this.article, this.onTap}) : super(key: key);

  final ArticleBean article;
  final TapCallback onTap;

  var infoStyle = TextStyle(color: Color(0xff999999), fontSize: 13);
  var littleStyle = TextStyle(color: Colors.black, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    var top = Row(//顶部,Row进行横向排列
      children: <Widget>[
        Container(child: article.userImage, width: 20, height: 20),
        Expanded(
          child: Padding(
            child: Text(article.userName),
            padding: EdgeInsets.only(left: 4),
          ),
        ),
        Text(article.type, style: infoStyle,)
      ],
    );

    var content = Column(//中间文字内容,交叉轴为start
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(article.title, style: littleStyle, maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          child: Text(article.info,
              style: infoStyle, maxLines: 2, overflow: TextOverflow.ellipsis),
          padding: EdgeInsets.only(top: 5),
        ),
      ],
    );

    var center = Row(//中间的部分
      children: <Widget>[
        Expanded(
            child: Padding(child: content, padding: EdgeInsets.all(5),)),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Image(width: 80, height: 80, fit: BoxFit.cover,image: article.cover,
          ),
        )
      ],
    );

    var end = Row(//底部
      children: <Widget>[
        Icon(Icons.grade, color: Colors.green, size: 20,),
        Text(article.starCount, style: infoStyle,),
        Padding(
          child: Icon(Icons.tag_faces, color: Colors.lightBlueAccent, size: 20),
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
        Text(article.commentCount, style: infoStyle),
      ],
    );

    var result = Card(//总体拼合
        child: InkWell(
            onTap: () {
              if (this.onTap != null) {
                onTap(article);
              }
            },
            child: Container(
              height: 160,
              padding: EdgeInsets.fromLTRB(10,15,10,15),
              child:
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[top,  center, end]),
            )));
    return result;
  }
}

typedef TapCallback = void Function(ArticleBean bean);//点击回调

class ArticleBean {
  Image userImage; //头像
  ImageProvider cover; //图片
  String userName; //用户名
  String title; //标题
  String type; //类型
  String info; //简介
  String starCount; //赞
  String commentCount;//评论个数

  ArticleBean(
      {this.userImage,
      this.cover,
      this.userName,
      this.title,
      this.type,
      this.info,
      this.starCount,
      this.commentCount}); //评论数
}

/// 测试
///
///
var show = ArticlePanel(
  article: ArticleBean(
      userName: "张风捷特烈",
      title: "[Flutter必备]-Flex布局完全解读",
      info: "也就是水平排放还是竖直排放，可以看出默认情况下都是主轴顶头,"
          "交叉轴居中比如horizontal下主轴为水平轴，交叉轴则为竖直。也就是水平顶头，竖直居中"
          "这里使用MultiShower快速展示,更好的对比出不同之处",
      type: "Flutter/Dart",
      starCount: "2000",
      commentCount: "3000",
      userImage: Image.asset("images/icon_head.png"),
      cover: AssetImage("images/wy_200x300.jpg")),
);
