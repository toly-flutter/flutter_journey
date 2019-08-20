import 'package:flutter/material.dart';

///记录节点信息的Node类
class Node {
  Widget me; //节点自身Widget
  List<Node> children; //节点所包含的Node
  Node({this.me, this.children});
}

class NodeWidget extends StatefulWidget {
  NodeWidget({Key key, this.node, this.onClickCallback}) : super(key: key);
  final Node node;
  final OnClickCallback onClickCallback;

  @override
  _NodeWidgetState createState() => _NodeWidgetState();
}

typedef OnClickCallback = void Function(bool closed);

class _NodeWidgetState extends State<NodeWidget> {
  Node node;
  bool showList = false;

  @override
  Widget build(BuildContext context) {
    return showNode(widget.node, showList);
  }

  Widget showNode(Node node, bool show) {
    var me = InkWell(
        child: node.me,
        onTap: () {
          showList = !showList;
          if (widget.onClickCallback != null) {
            widget.onClickCallback(!showList);
          }
          setState(() {});
        });
    if (show) {
      var children = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: node.children.map((node) => node.me).toList(),
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          me,
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: children,
          )
        ],
      );
    } else {
      return me;
    }
  }
}

///记录节点信息的Node类
class TextNode extends Node{
  String text;
  TextNode(text,{List<Node> children}):super(me:Text(text),children:children);
}

var friendsNode=[TextNode("张三丰"),TextNode("独孤九剑"),TextNode("令狐冲"),TextNode("魏无羡")];

//var friendsNode=[Node(me: Text("张三丰")),Node(me: Text("独孤九剑")),Node(me: Text("令狐冲")),Node(me: Text("魏无羡"))];
var node = Node(me: Text("我的好友",),
    children: [
      Node(me: NodeWidget(node: Node(me: Text("损友",), children: friendsNode))),
      Node(me: Text("好友")), Node(me: Text("道友",)), Node(me: Text("漫友",)), Node(me: Text("普友",)),
    ]);

var show = NodeWidget(node: node,);

