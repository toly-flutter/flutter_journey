import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_journey/toly_widget/user_panel.dart';
import 'package:http/http.dart' as client;

class GithubPanel extends StatefulWidget {

  GithubPanel({Key key,this.name}):super(key:key);
  final String  name;
  @override
  _GithubPanelState createState() => _GithubPanelState();
}

class _GithubPanelState extends State<GithubPanel> {

  User _user=User();

  @override
  void initState() {

    getUser(name: widget.name);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserPanel(user: _user,);
  }
  //获取用户信息
  getUser({String name='toly1994328'}){
    var api ='https://api.github.com/users/$name';//url
    client.get(api).then((rep){
      _user = User.fromMap(json.decode(rep.body));
      setState(() {});//刷新界面
    });
  }
}
