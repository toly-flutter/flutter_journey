import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBarTest extends StatelessWidget {
  CupertinoNavigationBarTest({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.back,color: Colors.blue,),
        middle: Text("风雪雅舍"),
        trailing: Image.asset("images/icon_head.png", width: 25.0, height: 25.0,),
        backgroundColor: Color(0xfff1f1f1),
        previousPageTitle: "返回",
        actionsForegroundColor: Colors.red,
//        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: false,
//          transitionBetweenRoutes:false,
    );
}

}