import 'package:flutter/material.dart';

typedef TapCallback = void Function(GoodBean bean);

class GoodBean {
  ImageProvider image ; //封面图
  String title; //链接
  double price; //价格
  int saleCount; //销售数
  GoodBean({this.image, this.title, this.price, this.saleCount});
}

class GoodsWidget extends StatelessWidget {
  GoodsWidget({Key key, this.goods, this.width, this.onTap}) : super(key: key);

  final GoodBean goods;
  final double width;
  final TapCallback onTap;

  @override
  Widget build(BuildContext context) {
    var top = ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4), topRight: Radius.circular(4)),
      child: Image(image: goods.image,fit: BoxFit.cover,),
    );

    var center = Text(
      goods.title,
      maxLines: 2,
    );

    var bottom = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: _getPriceWidget(goods.price),
        ),
        Expanded(
          child: Text(
            "${goods.saleCount}人付款",
            style: TextStyle(fontSize: 13, color: Colors.black38),
          ),
        ),
        Icon(Icons.more_horiz, color: Colors.black38)
      ],
    );

    var result = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          top,
          Padding(
            padding: EdgeInsets.all(10),
            child: center,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: bottom,
          )
        ]);

    return Card(
      elevation: 5,
      child: InkWell(
        child: Container(
          width: width,
          child: result,
        ),
        onTap: () {
          if (onTap != null) {
            onTap(goods);
          }
        },
      ),
    );
  }

  Widget _getPriceWidget(double price) {
    //创建价格组件
    var prices = price.toString().split(".");
    var span = TextSpan(
      text: '￥',
      style: TextStyle(fontSize: 12, color: Colors.deepOrangeAccent),
      children: <TextSpan>[
        TextSpan(
            text: "${prices[0]}.",
            style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent)),
        TextSpan(
            text: "${prices[1]}",
            style: TextStyle(fontSize: 12, color: Colors.deepOrangeAccent)),
      ],
    );
    return RichText(text: span);
  }
}

var show = GoodsWidget(
  onTap: (goods) {
    print(goods.title);
  },
  width: 200,
  goods: GoodBean(
      price: 21.89,
      saleCount: 99,
      title: "得力笔记本文具商务复古25K/A5记事本PU软皮面日记本子定制可印logo简约工作笔记本会议记录本小清新大学生用",
      image:AssetImage("images/note_cover.jpg"),
));
