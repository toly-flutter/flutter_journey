import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;

import 'github_panel.dart';
import 'user.dart';

class GithubUserPanel extends StatefulWidget {
  GithubUserPanel({
    Key key,
    this.userName,
  }) : super(key: key);

  final String userName;

  @override
  _GithubUserPanelState createState() => _GithubUserPanelState();
}

class _GithubUserPanelState extends State<GithubUserPanel> {
  var baseUrl = "https://api.github.com/";
  var operate = "users/";
  var panel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var api = baseUrl + operate + widget.userName; //url
    client.get(api).then((rep) {
      var user = User.fromJson(json.decode(rep.body));
      panel = GithubPanel(
        user: user,
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: panel,
    );
  }
}
