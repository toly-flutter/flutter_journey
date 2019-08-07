import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  CircleImage(
      {Key key,
      @required this.image,
      this.size=70,
      this.shadowColor,
      this.roundColor})
      : super(key: key);

  final ImageProvider image;//图片
  final double size;//大小
  final Color shadowColor;//阴影颜色
  final Color roundColor;//边框颜色

  @override
  Widget build(BuildContext context) {
    var headIcon = Container(
        decoration: BoxDecoration(//圆形装饰线
          color: roundColor??Colors.white,
          shape: BoxShape.circle,
          boxShadow: [ //阴影
            BoxShadow(
              color: shadowColor??Colors.grey.withOpacity(0.3),
              offset: Offset(0.0, 0.0),
              blurRadius: 3.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        width: size,
        height: size,
        child: Padding(padding: EdgeInsets.all(3),child: CircleAvatar(
          backgroundImage: image,
        ),
        ),);

    return headIcon;
  }
}

// 测试--------------------
var wrap=Wrap(
  spacing: 10,
  runSpacing: 10,
crossAxisAlignment:WrapCrossAlignment.center,
  children: <Widget>[
  CircleImage(image: AssetImage("images/icon_head.png"),size: 100),
  CircleImage(image: AssetImage("images/icon_head.png"),size: 100,shadowColor: Colors.blue,roundColor: Colors.blue,),
  CircleImage(image: AssetImage("images/icon_head.png"),size: 100,shadowColor: Colors.red,roundColor: Colors.red,),
  CircleImage(image: AssetImage("images/icon_head.png"),size: 100,roundColor: Colors.purple,shadowColor: Colors.red,),
  CircleImage(image: AssetImage("images/icon_head.png"),size: 100,shadowColor: Colors.blue,roundColor: Colors.orangeAccent,),
],);

var show=Center(child: wrap,);