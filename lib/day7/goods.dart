import 'package:flutter/material.dart';

class Goods extends StatelessWidget {
  Goods({Key key, this.goods, this.width,this.onTap}) : super(key: key);

  final GoodBean goods;
  final double width;
  final TapCallback onTap;
  @override
  Widget build(BuildContext context) {
    var top = Image.network(goods.caverUrl);

    var center = Container(
      child: Text(
        goods.title,
        maxLines: 2,
      ),
    );
    var bottom = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: _getPriceWidget(goods.price),
        ),
        Expanded(
          child: Text("${goods.saleCount}人付款",style: TextStyle(fontSize:13,color: Colors.black38),),
        ),
        Icon(Icons.more_horiz,color: Colors.black38)
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
            padding: EdgeInsets.fromLTRB(10,0,10,10),
            child: bottom,
          )
        ]);
    return Card(
      elevation: 5,
      child: InkWell(child: Container(
        width: width,
        child: result,
      ),onTap: (){
        if(onTap!=null){
          onTap(goods);
        }
      },),
    );
  }

  Widget _getPriceWidget(double price) {
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

typedef TapCallback = void Function(GoodBean bean);

class GoodBean {
  String caverUrl; //封面图链接
  String title; //链接
  double price; //价格
  int saleCount;
  GoodBean({this.caverUrl, this.title, this.price, this.saleCount}); //销售数
}
