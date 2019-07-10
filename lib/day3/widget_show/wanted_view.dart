import 'package:flutter/material.dart';



class WantedView extends StatelessWidget {
  const WantedView(
    this.imageAsset, {
    this.width,
    Key key,
  }) : super(key: key);

  final double width;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {

    const double viewRate = 0.663306; //试图宽高比
    const double imgRate = 1.234411;//图片宽高比
    var width =300.0;
    double height = width/viewRate;

    var textWanted= Text('WANTED',
       style: TextStyle(
           fontWeight: FontWeight.bold,
           letterSpacing:width/30,
           fontSize: width/6),
    );

    var name =Text('MONKEY.D.LUFFY',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: width/9.5),
    );

    var price= Text('30,000,000',
      style: TextStyle(
          letterSpacing:width/45,
          fontWeight: FontWeight.bold,
          fontSize: width/10),
    );


    var img =Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: width/100),
      ),
      width: width,
      height: width/imgRate,
      child: Image.asset('images/lifei.jpeg',fit: BoxFit.cover,),
    );

    var bottom =Stack(
      children: <Widget>[
        Image.asset('images/bottom.jpg',fit: BoxFit.fitWidth,),

        Container(child: name,alignment: Alignment.topCenter,padding: EdgeInsets.only(top: 6*width/100),),
        Container(child: price,alignment: Alignment.topCenter,padding: EdgeInsets.only(top: 17*width/100),)
      ],);


    var wanted = Container(
      width: width,
      height: height,
      color: Color(0xffded0b5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[textWanted,Padding(padding:
        EdgeInsets.fromLTRB(5*width/100,0,5*width/100,5*width/100),child: img,),
          bottom
        ],),
    );

    var result=Center(child: Card(child:wanted ,elevation: 5*width/100,),);

    return result;
  }
}
