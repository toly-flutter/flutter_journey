import 'package:flutter/material.dart';

class ArticlePanel extends StatelessWidget {
  ArticlePanel({Key key, this.article, this.onTap}) : super(key: key);

  final ArticleBean article;
  final TapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _showItem(article);
  }

  _showItem(ArticleBean article) {
    var infoStyle = TextStyle(color: Color(0xff999999), fontSize: 13);
    var littleStyle = TextStyle(color: Colors.black, fontSize: 16);
    var top = Row(
      //顶部,通过Flex布局的Row进行横向排列
      children: <Widget>[
        Container(child: article.userIcon, width: 20, height: 20),
        Expanded(
          child: Padding(
            child: Text(article.userName),
            padding: EdgeInsets.only(left: 4),
          ),
        ),
        Text(
          article.type,
          style: infoStyle,
        )
      ],
    );

    var content = Column(
      //中间文字内容,交叉轴为start
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          article.title,
          style: littleStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          child: Text(article.info,
              style: infoStyle, maxLines: 2, overflow: TextOverflow.ellipsis),
          padding: EdgeInsets.only(top: 5),
        ),
      ],
    );

    var center = Row(
      //中间的部分
      children: <Widget>[
        Expanded(
            child: Padding(
          child: content,
          padding: EdgeInsets.all(5),
        )),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            width: 80,
            height: 80,
            child: article.cover,
          ),
        )
      ],
    );

    var end = Row(
      //底部
      children: <Widget>[
        Icon(
          Icons.grade,
          color: Colors.green,
          size: 20,
        ),
        Text(
          article.starCount,
          style: infoStyle,
        ),
        Padding(
          child: Icon(Icons.tag_faces, color: Colors.lightBlueAccent, size: 20),
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
        Text(article.commentCount, style: infoStyle),
      ],
    );

    var result = Card(
        //总体拼合
        child: InkWell(
            onTap: () {
              if (this.onTap != null) {
                onTap(article);
              }
            },
            child: Container(
              height: 160,
              padding: EdgeInsets.all(10),
              child:
                  Column(children: <Widget>[top, Expanded(child: center), end]),
            )));

    return result;
  }
}

typedef TapCallback = void Function(ArticleBean bean);

class ArticleBean {
  Image userIcon; //头像
  Image cover; //图片
  String userName; //用户名
  String title; //标题
  String type; //类型
  String info; //简介
  String starCount; //赞
  String commentCount;

  ArticleBean(
      {this.userIcon,
      this.cover,
      this.userName,
      this.title,
      this.type,
      this.info,
      this.starCount,
      this.commentCount}); //评论数

}
