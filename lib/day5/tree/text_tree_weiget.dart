import 'dart:math';
import 'package:flutter/material.dart';
///记录节点信息的Node类
class Node {
  Widget me; //节点自身Widget
  List<Node> children; //节点所包含的Node
  Node({this.me, this.children});
}
typedef OnClickCallback = void Function(bool closed);
class TextTreeWidget extends StatefulWidget {
  TextTreeWidget({Key key, this.node, this.onClickCallback}) : super(key: key);

  final Node node;//节点
  final OnClickCallback onClickCallback;//回调监听

  factory TextTreeWidget.fromStr(String me,List<String> children){
    return TextTreeWidget(node: Node(me: Text(me),
        children: children.map((e)=>Node(me: Text(e))).toList()),);
  }
  @override
  _TextTreeWidgetState createState() => _TextTreeWidgetState();
}

class _TextTreeWidgetState extends State<TextTreeWidget> {
  Node node;
  bool showList = false;//是否显示孩子
  @override
  Widget build(BuildContext context) {
    return showNode(widget.node, showList);
  }
  Widget showNode(Node node, bool show) {
    var me = InkWell(//自己的组件
        child: formWidget(node.me),
        onTap: () {
          showList = !showList;
          if (widget.onClickCallback != null) {
            widget.onClickCallback(!showList);
          }
          setState(() {});
        });
    if (show) {//如果显示的话，加上孩子，否则只返回自己
      var children = Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: node.children.map((node) => node.me).toList(),);
      return Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[me,
          Padding(padding: EdgeInsets.only(left: 30),
            child: SingleChildScrollView(child: children,),)],);
    } else {
      return me;
    }
  }
  Widget formWidget(Widget me) {//加小图标
    return Row(crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Transform.rotate(
          angle: !showList ? 0 : 45 / 180 * pi,
          child: Icon(Icons.arrow_right),
        ),
        me
      ],
    );
  }
}

var node = Node(me: Text("我的好友"),
    children: [
      Node(me: TextTreeWidget.fromStr("损友",["张三丰","独孤九剑","令狐冲","魏无羡"])),
      Node(me: TextTreeWidget.fromStr("好友",["西施","杨玉环","王昭君","貂蝉"])),
      Node(me: TextTreeWidget.fromStr("道友",[])), Node(me: TextTreeWidget.fromStr("漫友",[])),]);

var show = TextTreeWidget(node: node,);
