import 'package:flutter/material.dart';

class ItemChart extends StatefulWidget {
  ItemChart({Key key,this.chartBean,this.onTap}) : super(key: key);
  final ChartBean chartBean;
  final TapCallback onTap;
  @override
  _ItemChartState createState() => _ItemChartState();
}

class _ItemChartState extends State<ItemChart> {
  var nameTextStyle = TextStyle(color: Colors.black, fontSize: 16);
  var infoTextStyle = TextStyle(color: Color(0xff999999), fontSize: 12);
  bool _checked=false;//是否已查看

  @override
  Widget build(BuildContext context) {

    var left = Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: widget.chartBean.image,
      ),
      width: 50,
      height: 50,
    );


    var leftWrap = Stack(
      alignment: Alignment(1.2, -1.2),
      children: <Widget>[
        left,
        ClipOval(child: Container(width: 10, height: 10, color: Colors.red,),)
      ],);

    var center = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.chartBean.name, style: nameTextStyle),
        Padding(padding: EdgeInsets.only(top:4),child: Text(
          widget.chartBean.sentence,
          style: infoTextStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),)
      ],
    );

    var right = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.chartBean.time, style: infoTextStyle),
        widget.chartBean.shield?Icon(
          Icons.visibility_off,
          size: 18,
          color: Color(0xff999999),
        ):Container(height: 18,)
      ],
    );
    var body = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[Padding(padding: EdgeInsets.only(right: 10),child: _checked?left:leftWrap,), Expanded(child: center,), right],
    );
    return InkWell(child:Container(child: body, padding: EdgeInsets.all(10),) ,onTap: (){
      _checked=true;
      if(widget.onTap!=null){
        widget.onTap(widget.chartBean);
      }
      setState(() {

      });

    },);
  }
}

typedef TapCallback = void Function(ChartBean bean);

class ChartBean{
  Image image;//头像
  String name;//名字
  String sentence;//句子
  String time;//时间
  bool shield;//是否屏蔽

  ChartBean({this.image, this.name, this.sentence, this.time,
      this.shield=false});
}
