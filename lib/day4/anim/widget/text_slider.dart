import 'package:flutter/material.dart';

class TextSlider extends StatefulWidget {

  ValueChanged onChanged;
  TextSlider({this.onChanged});

  @override
  State<StatefulWidget> createState() => _TextSliderState();
}

typedef ValueChanged = void Function(double value);

class _TextSliderState extends State<TextSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {

    var show = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCheckBox(_value),
            _buildText(_value),
          ],
        ),
        _buildSlider(_value)
      ],
    );

    return show;
  }

  _buildSlider(double value) {
    var slider = Slider(
      value: value,
      max: 100,
      min: 0,
      onChanged: (e) {
//        print('onChanged:$e');

        _render(e);
      },
      onChangeStart: (e) {
//        print('onChangeStart:$e');
      },
      onChangeEnd: (e) {
//        print('onChangeEnd:$e');
      },
//      divisions: 5,
    );

    return slider;
  }

  _render(double value) {
    if(widget.onChanged!=null){
      widget.onChanged(value);
    }
    _value = value;
    print(value);
    setState(() {});
  }

  _buildText(double value) {
    return Text(
      value.toStringAsFixed(2), //保留两位有效数字
      style: TextStyle(fontSize: 20),
    );
  }

  _buildCheckBox(double value) {
    var checked = value > 50;
    return Checkbox(
      value: checked,
      onChanged: (bool) {
        _render(0);
      },
    );
  }
}
