import 'package:flutter/material.dart';

class StatefulShow extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StatefulShowState();

}

class _StatefulShowState extends State<StatefulShow>{
   double left=0;
   double right=1;

  @override
  Widget build(BuildContext context) {

    var show=_showRangeSlider(RangeValues(left, right));

    return show;
  }



  _showRangeSlider(RangeValues rangeValues){
    var rangeSlider =RangeSlider(
      values: rangeValues,
      onChanged: (e){
        print('onChanged:$e');
        _render(e);
      },
      onChangeStart: (e){
        print('onChangeStart:$e');

      },
      onChangeEnd: (e){
        print('onChangeEnd:$e');
      },
      divisions: 5,
    );
    return rangeSlider;
  }

  _render(RangeValues e){
    left=e.start;
    right=e.end;

    setState(() {

    });
  }
}