

import 'package:flutter/material.dart';

import 'multi_shower.dart';



testDirection(){
  var redBox= Container(
    color: Colors.red,
    height: 50,
    width: 50,
  );

  var blueBox= Container(
    color: Colors.blue,
    height: 30,
    width: 60,
  );

  var yellowBox= Container(
    color: Colors.yellow,
    height: 50,
    width: 100,
  );

  var greenBox= Container(
    color: Colors.green,
    height: 60,
    width: 60,
  );


  var direction =[Axis.horizontal,Axis.vertical];

  var show = MultiShower(direction,(e){
    return Flex(
      direction: e,
      children: <Widget>[redBox,blueBox,yellowBox,greenBox],

    );
  },color: Colors.black12,width: 300,height: 200);

  return show;
}


testMainAxisAlignment(){
  var redBox= Container(
    color: Colors.red,
    height: 50,
    width: 50,
  );

  var blueBox= Container(
    color: Colors.blue,
    height: 30,
    width: 60,
  );

  var yellowBox= Container(
    color: Colors.yellow,
    height: 10,
    width: 10,
  );

  var greenBox= Container(
    color: Colors.green,
    height: 50,
    width: 10,
  );


  var mainAxisAlignment =[MainAxisAlignment.start,MainAxisAlignment.center,MainAxisAlignment.end,MainAxisAlignment.spaceAround,MainAxisAlignment.spaceBetween,MainAxisAlignment.spaceEvenly];

  var show = MultiShower(mainAxisAlignment,(e){
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: e,
      children: <Widget>[redBox,blueBox,yellowBox,greenBox],

    );
  },color: Colors.black12,width: 200,height: 150);

  return show;
}

testCrossAxisAlignment(){
  var redBox= Container(
    color: Colors.red,
    height: 50,
    width: 50,
  );

  var blueBox= Container(
    color: Colors.blue,
    height: 30,
    width: 60,
  );

  var yellowBox= Container(
    color: Colors.yellow,
    height: 10,
    width: 10,
  );

  var greenBox= Container(
    color: Colors.green,
    height: 50,
    width: 10,
  );

  var crossAxisAlignment =[CrossAxisAlignment.start,CrossAxisAlignment.center,
    CrossAxisAlignment.end,CrossAxisAlignment.stretch,CrossAxisAlignment.baseline];

  var show = MultiShower(crossAxisAlignment,(e){
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: e,
      textBaseline: TextBaseline.alphabetic,//基线类型
      children: <Widget>[redBox,blueBox,yellowBox,greenBox],

    );
  },color: Colors.black12,width: 200,height: 140);

  return show;
}


testMainAxisSize(){
  var redBox= Container(
    color: Colors.red,
    height: 50,
    width: 50,
  );

  var blueBox= Container(
    color: Colors.blue,
    height: 30,
    width: 60,
  );

  var yellowBox= Container(
    color: Colors.yellow,
    height: 10,
    width: 10,
  );

  var greenBox= Container(
    color: Colors.green,
    height: 50,
    width: 10,
  );

  return Center(child: Flex(
    direction: Axis.horizontal,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[redBox,blueBox,yellowBox,greenBox],

  ),);
}

testTextDirection(){
  var redBox= Container(
    color: Colors.red,
    height: 50,
    width: 50,
  );

  var blueBox= Container(
    color: Colors.blue,
    height: 30,
    width: 60,
  );

  var yellowBox= Container(
    color: Colors.yellow,
    height: 10,
    width: 10,
  );

  var greenBox= Container(
    color: Colors.green,
    height: 50,
    width: 10,
  );

  var textDirection =[TextDirection.ltr,TextDirection.rtl];

  var show = MultiShower(textDirection,(e){
    return Flex(
      direction: Axis.horizontal,
      textDirection: e,
      children: <Widget>[redBox,blueBox,yellowBox,greenBox],

    );
  },color: Colors.black12,width: 200,height: 140);

  return show;
}

testVerticalDirection(){
  var redBox= Container(
    color: Colors.red,
    height: 50,
    width: 50,
  );

  var blueBox= Container(
    color: Colors.blue,
    height: 30,
    width: 60,
  );

  var yellowBox= Container(
    color: Colors.yellow,
    height: 10,
    width: 10,
  );

  var greenBox= Container(
    color: Colors.green,
    height: 50,
    width: 10,
  );

  var verticalDirection =[VerticalDirection.up,VerticalDirection.down];

  var show = MultiShower(verticalDirection,(e){
    return Flex(
      direction: Axis.vertical,
      verticalDirection: e,
      children: <Widget>[redBox,blueBox,yellowBox,greenBox],

    );
  },color: Colors.black12,width: 200,height: 140);

  return show;
}

testTextBaseline(){
  var redBox= Text(
    "张风捷特烈",style: TextStyle(fontSize: 20,backgroundColor: Colors.red),
  );

  var blueBox= Text(
    "toly",style: TextStyle(fontSize: 50,backgroundColor: Colors.blue),
  );

  var yellowBox=  Text(
    "1994",style: TextStyle(fontSize: 30,backgroundColor: Colors.green),
  );

  var textBaseline =[TextBaseline.alphabetic,TextBaseline.ideographic];

  var show = MultiShower(textBaseline,(e){
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: e,
      children: <Widget>[redBox,blueBox,yellowBox],

    );
  },color: Colors.black12,width: 300,height: 140);

  return show;
}

var show=testTextBaseline();