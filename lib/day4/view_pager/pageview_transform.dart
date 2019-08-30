import 'dart:math';

import 'package:flutter/material.dart';

class PageViewSimple extends StatefulWidget {
  PageViewSimple({this.height,this.width});
  final double height;//组件高
  final double width;//组件宽

  @override
  _PageViewSimpleState createState() => _PageViewSimpleState();
}

class _PageViewSimpleState extends State<PageViewSimple> {
  var width;
  var height;
  List<Color> _colors;

  var _viewportFraction=0.6;//视口缩放比
  var _pageCtrl;//页面控制器

  static final _baseOffset = 10000;//初始偏移
  static final _initOffset = 1;//初始索引位

  var _factor=0.0;//分度值
  var _realPosition=_baseOffset+_initOffset;//真实索引位
  @override
  void initState() {
    _colors = [Colors.red, Colors.yellow, Colors.blue,
      Colors.green, Colors.black];
    _pageCtrl = PageController(//初始化页面控制器
      viewportFraction: _viewportFraction,//视口缩放比
      initialPage: _baseOffset+_initOffset,//初始页面位置
    )..addListener((){//对PageView进行监听
      var page = _pageCtrl.page-_baseOffset;
      var floor=page.floor();
      _factor=page-floor;//获取分度值
      setState(() {//刷新状态，更新真实索引位
        _realPosition=_pageCtrl.page.floor();
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width= widget.width??MediaQuery.of(context).size.width;//宽不设置默认为屏宽
    height=widget.height??120.0;//高不设置默认为120
    return Container(
      width: width,
      height: height,
      child: PageView.builder(//使用PageView
          controller: _pageCtrl,
          scrollDirection: Axis.horizontal,//滑动方向
          itemCount: null,//条目个数无限
          itemBuilder: (ctx, i) => buildChild(_colors, i)//创建条目
      ),
    );
  }

  ///创建item
  Widget buildChild(List<Color> colors, int index) {
    var i=fixPosition(index, _baseOffset, colors.length);
    var child=  AnimatedBuilder(
        animation:_pageCtrl,
        child: Container(
          alignment: Alignment.center,
          color: colors[i],
          child: Text("第$i页", style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        builder: (BuildContext context, child) {
          if (_pageCtrl.position.minScrollExtent == null ||
              _pageCtrl.position.maxScrollExtent == null) {
            Future.delayed(Duration(microseconds: 1), ()=>setState(() {}));
            return Container();
          }

          var offset=width * _viewportFraction * 0.35*(1-_factor);//偏移
          var center= Offset(width * _viewportFraction / 2, height / 2);//变换中心
          var angle=10*(1-_factor) / 180 * pi;//倾斜角度
          var scale=0.5+0.5*_factor;//缩放

          if (index == _realPosition - 1 ) {//左侧变换
            return Transform.scale(scale:scale,//缩放变换
              child: Transform.translate(//位移变化
                  offset: Offset(offset, 0),
                  child: Transform(origin: center,//倾斜变化
                      transform: Matrix4.skew(angle, -angle),
                      child:child)),
            );
          }
          if (index == _realPosition + 1 ) {//右侧变换
            return Transform.scale(scale:scale,
              child: Transform.translate(
                  offset: Offset(-offset, 0),
                  child: Transform(origin: center,
                      transform: Matrix4.skew(-angle, angle),
                      child:child)),
            );
          }
          return Transform.scale(
            scale:1-0.5*_factor,
            child: child,
          );
        });

    return child;
  }


  //修正索引
  int fixPosition(int realPos, int initPos, int length) {
    final int offset = realPos - initPos;
    int result = offset % length;
    return result < 0 ? length + result : result;
  }


}
