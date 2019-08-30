import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {

  @override
  _OtherPageState createState(){
    print('lifecycle OtherPage----->createState');
    return _OtherPageState();
  }

  OtherPage(){
    print('lifecycle OtherPage----->OtherPage constructor构造器调用');
  }
}

class _OtherPageState extends State<OtherPage> {
  String _title;

  _changeTitle(String title) {
    setState(() {
      _title = title;
    });
  }


  _OtherPageState(){
    print('lifecycle OtherPage----->_OtherPageState constructor构造器调用');
  }

  @override
  Widget build(BuildContext context) {
    print('lifecycle OtherPage----->build');
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _changeTitle('改变标题');
          },
          child: Text('返回第一页面'),
        ),
      ),
    );
  }

  @override
  void reassemble() {
    print('lifecycle OtherPage----->reassemble');
    super.reassemble();
  }

  @override
  void didUpdateWidget(OtherPage oldWidget) {
    print('lifecycle OtherPage----->didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('lifecycle OtherPage----->deactivate');
    super.deactivate();
  }

  @override
  void setState(fn) {
    print('lifecycle OtherPage----->setState');
    super.setState(fn);
  }

  @override
  void dispose() {
    print('lifecycle OtherPage----->dispose');
    super.dispose();
  }
}
