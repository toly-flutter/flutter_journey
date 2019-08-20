import 'package:flutter/material.dart';

class GlobalKeysReuseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<GlobalKeysReuseWidget> {
  final configWidgetGlobalKey = GlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: TabBar(
          labelColor: Theme.of(context).accentColor,
          tabs: <Widget>[Icon(Icons.access_alarms), Icon(Icons.work)],
        ),
        body: TabBarView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: ConfigWidget(scaffoldKey, key: configWidgetGlobalKey),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 200),
              child: ConfigWidget(scaffoldKey, key: configWidgetGlobalKey),
            )
          ],
        ),
      ),
    );
  }
}

class ConfigWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  ConfigWidget(this.scaffoldKey, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfigWidgetState();
}

class _ConfigWidgetState extends State<ConfigWidget> {
  bool enable = false;
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Only wifi:"),
            ),
            Switch(
              onChanged: (bool v) {
                setState(() {
                  enable = v;
                });
                showSnackBar(v);
              },
              value: enable,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text('Volume:'),
            ),
            Slider(
              onChanged: (double v) {
                setState(() {
                  sliderValue = v;
                });
              },
              value: sliderValue,
            )
          ],
        )
      ],
    );
  }

  void showSnackBar(bool b) {
    widget.scaffoldKey.currentState.hideCurrentSnackBar();
    final bar = SnackBar(content: Text("enable: $b"));
    widget.scaffoldKey.currentState.showSnackBar(bar);
  }
}
