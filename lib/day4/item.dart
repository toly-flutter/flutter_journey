import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/color_utils.dart';

class ColorItemStateFul extends StatefulWidget {

  ColorItemStateFul(this.text){
    print("ColorTextItem init----------$text------");
  }

  final  String text;
  @override
  _ColorItemStateFulState createState() => _ColorItemStateFulState();
}

class _ColorItemStateFulState extends State<ColorItemStateFul> {
  @override
  void initState() {
    print("_ColorItemStateFulState initState----------${widget.text}------");
    super.initState();
  }

  @override
  void dispose() {
    print("_ColorItemStateFulState dispose----------${widget.text}------");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("_ColorItemStateFulState build----------${widget.text}------");
    return Container(
      height: 100,
      color: randomColor(),
      child: Text(widget.text),
    );
  }
}


class ColorTextItem extends StatelessWidget {
final  String text;


ColorTextItem(this.text){
  print("ColorTextItem init----------$text------");
}

@override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: randomColor(),
      child: Text(text),
    );
  }
}

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: 100,
        itemBuilder: (_,index)=>ColorItemStateFul('第$index条'));
  }
}

