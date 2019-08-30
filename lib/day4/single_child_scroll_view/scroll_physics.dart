import 'package:flutter/material.dart';
import 'package:flutter_journey/toly_widget/multi_shower.dart';

class AttrPhysicsTest extends StatefulWidget {
  AttrPhysicsTest({
    Key key,
  }) : super(key: key);

  @override
  _AttrPhysicsTestState createState() => _AttrPhysicsTestState();
}

class _AttrPhysicsTestState extends State<AttrPhysicsTest> {
  var rainbow = [
    //颜色列表
    0xffff0000, 0xffFF7F00, 0xffFFFF00,
    0xff00FF00, 0xff00FFFF, 0xff0000FF, 0xff8B00FF
  ];

  @override
  Widget build(BuildContext context) {

    var items=Column(//颜色条
      children: rainbow
          .map((color) => Container(
        height: 35,
        width: 200,
        color: Color(color),
      ))
          .toList(),
    );


    var attrs=[FixedExtentScrollPhysics(),PageScrollPhysics(),BouncingScrollPhysics(),NeverScrollableScrollPhysics(),ClampingScrollPhysics(),AlwaysScrollableScrollPhysics()];
    var attrsInfo=['FixedExtentScrollPhysics()','PageScrollPhysics()','BouncingScrollPhysics()','NeverScrollableScrollPhysics()','ClampingScrollPhysics()','AlwaysScrollableScrollPhysics()'];
   var shower= MultiShower(attrs,(e){
    return  Container(
        padding: EdgeInsets.all(8),
        width: 300,
        height: 150,
        color: Colors.grey.withAlpha(44),
        child:SingleChildScrollView(
          physics: e,

            child: items),
      );
    },infos:attrsInfo,width: 300,height: 150,);


    return shower;
  }
}
