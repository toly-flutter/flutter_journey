import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  ToggleWidget(
      {Key key,
      @required this.children,
      this.onToggleCallback,
      this.duration_ms = 150})
      : super(key: key);

  final List<Widget> children; //子组件列表
  final OnToggleCallback onToggleCallback; //a回调监听
  final int duration_ms; //动画时间

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

typedef OnToggleCallback = void Function(int index);

class _ToggleWidgetState extends State<ToggleWidget>
    with SingleTickerProviderStateMixin {
  int _position = 0; //当前位置
  int childCount = 0; //孩子的数量
  AnimationController controller; //动画控制器
  double factor = 1; //动画因子

  @override
  void initState() {
    childCount = widget.children.length;
    controller = //创建AnimationController对象
        AnimationController(
            duration: Duration(milliseconds: widget.duration_ms), vsync: this)
          ..addListener(() {
            factor = 0.5 - 0.5 * controller.value + 0.5;
            setState(() {});
          })
          ..addStatusListener((s) {
            if (s == AnimationStatus.completed) {
              //动画介绍，进入下一个
              _position++;
              _position %= childCount; //这里实现循环点击
              factor = 1;
              if (widget.onToggleCallback != null) {
                widget.onToggleCallback(_position);
              }
              setState(() {});
            }
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var show = IndexedStack(
      //使用IndexStack实现叠合单显
      alignment: Alignment.center,
      index: _position,
      children: widget.children,
    );

    return GestureDetector(
      //检测点击手势
      onTap: _toggle, //点击执行动画
      child: Opacity(
        //透明度
        opacity: factor,
        child: Transform.scale(
          //缩放
          scale: factor,
          child: show,
        ),
      ),
    );
  }

  void _toggle() {
    controller.reset();
    controller.forward();
  }
}

///---------------简单示例--------------
var icons = [
  Icons.skip_next,
  Icons.stop,
  Icons.skip_previous,
  Icons.youtube_searched_for
];

var show = ToggleWidget(
  duration_ms: 100,
  children: icons.map((e) {
    return Icon(e, size: 100, color: Colors.deepOrangeAccent);
  }).toList(),
  onToggleCallback: (index) {
    print(index);
  },
);
