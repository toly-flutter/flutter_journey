import 'package:flutter/material.dart';


class ShapeColor extends StatelessWidget {
  ShapeColor(
      {Key key, this.radius = 20, this.checked = true, this.color})
      : super(key: key);
  final double radius;//半径
  final bool checked;//标记是否被选中
  final Color color;//颜色

  @override
  Widget build(BuildContext context) {
    var shape = Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        //圆形装饰线
        color: color ?? Colors.red,
        shape: BoxShape.circle,
        boxShadow: checked
            ? [BoxShadow( //阴影
                  color: Colors.blue.withAlpha(88),
                  offset: Offset(0.0, 0.0),
                  spreadRadius: radius / 10,
                ),
              ] : [],
      ),
    );
    return  shape;
  }
}

typedef CheckCallback = void Function(Color color);//定义回调
class ColorChooser extends StatefulWidget {
  ColorChooser({Key key, this.radius = 20, @required this.colors,@required this.onChecked})
      : super(key: key);
  final double radius;//半径
  final List<Color> colors;//颜色
  final CheckCallback onChecked;//点击回调
  @override
  _ColorChooserState createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooser> {
  List<bool> _checkLi;
  int _perPosition = 0;//刚才的位置

  @override
  void initState() {
    _checkLi = List.generate(widget.colors.length, (_) => false);//初始化布尔对应表
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var li = <Widget>[];
    for (var i = 0; i < widget.colors.length; i++) {
      li.add(GestureDetector(
        onTap: (){
          _checkLi[_perPosition]=false;//前一个置false,则该位置未被选中
          _perPosition=i;//更新点位
          _checkLi[i]=true;//当前置true,则该位置被选中
          if(widget.onChecked!=null) widget.onChecked(widget.colors[i]);//回调
          setState(() {//刷新
          });
        },
          child: ShapeColor(color:widget.colors[i], radius:widget.radius,checked:_checkLi[i])));
    }
    return  Wrap(spacing: 10, runSpacing:10,children: li);
  }
}
