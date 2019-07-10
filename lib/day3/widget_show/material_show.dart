import 'package:flutter/material.dart';

class MaterialShow extends StatefulWidget {
  MaterialShow({Key key}) : super(key: key);

  @override
  _MaterialShowState createState() => _MaterialShowState();
}

class _MaterialShowState extends State<MaterialShow> {
//  var _position = 0;

  @override
  Widget build(BuildContext context) {
    var scfContext;

    var tabs = ["关注", "推荐", "热榜", "前端", "Android"]; //标题列表
    var tabBar = TabBar(
      //头部标签
      labelStyle: TextStyle(fontSize: 14), //字号
      labelColor: Color(0xffffffff), //当前选中文字颜色
      unselectedLabelColor: Color(0xffeeeeee), //未选中文字颜色
      tabs: tabs.map((tab) {
        //标签Widget
        return Container(
          alignment: AlignmentDirectional.center,
          child: Text(tab),
          height: 40,
        );
      }).toList(),
    );

    var tabBarView = new TabBarView(
      //主页面
      children: tabs.map((text) {
        return new Center(
            child: new Text(
          text,
          style: TextStyle(fontSize: 20),
        ));
      }).toList(),
    );

    var drawer = Drawer(
        elevation: 5,
        child: Container(
          alignment: AlignmentDirectional.center,
          color: Color(0xff99C6F9),
          child: Text(
            "Flutter之旅",
            style: TextStyle(fontSize: 30),
          ),
        ));

    var iconsMap = {
      "首页": Icon(Icons.home),
      "动态": Icon(Icons.toys),
      "搜索": Icon(Icons.search),
      "消息": Icon(Icons.mail),
      "我": Icon(Icons.person),
    };

    var bottomNavigationBar = BottomNavigationBar(
      //底部栏
      items: () {
        var items = <BottomNavigationBarItem>[];
        iconsMap.forEach((k, v) {
          items.add(BottomNavigationBarItem(
              title: Text(k), icon: v, backgroundColor: Color(0xff49B1FB)));
        });
        return items;
      }(),
      currentIndex: 0,
      onTap: (position) {
        print(position);
      },
    );

    var checkbox = Checkbox(
      value: true,
      activeColor: Colors.blue,
      onChanged: (value) {
        print(value);
      },
    );

    var switcher = Switch(
      value: true,
      activeColor: Colors.greenAccent,
      activeTrackColor: Colors.black,
      activeThumbImage: AssetImage("images/icon_switch.png"),
      onChanged: (bool value) {
        print(value);
      },
    );

    var numLi = [1, 2, 3];
    var radios = Wrap(
        children: numLi.map((i) {
      return Radio<int>(
        value: i,
        groupValue: 1,
        onChanged: (int value) {},
      );
    }).toList());

    var chip = Chip(
      backgroundColor: Color(0xffE5E5E5),
      padding: EdgeInsets.all(3),
      avatar: CircleAvatar(
          backgroundColor: Colors.lightBlue.shade400,
          child: new Text(
            'Toly',
            style: TextStyle(fontSize: 10.0, color: Colors.white),
          )),
      label: Text('张风捷特烈'),
    );

    var slider = Slider(
      min: 100,
      max: 250,
      value: 180,
      activeColor: Colors.green,
      inactiveColor: Colors.grey,
      onChanged: (value) {
        print(value);
      },
      onChangeStart: (v) {},
      onChangeEnd: (v) {},
    );

    var widgets = <Widget>[checkbox, switcher, radios, chip];

    var raisedButton = RaisedButton(
      onPressed: () {},
      child: Text("raised"),
      textColor: Color(0xffFfffff),
      color: Colors.blue,
      highlightColor: Color(0xffF88B0A),
    );

    var flatButton = FlatButton(
      onPressed: () {},
      child: Text("flat"),
      color: Colors.blue,
      highlightColor: Color(0xffF88B0A),
      textColor: Color(0xffFfffff),
    );

    var outLineButton = OutlineButton(
      onPressed: () {},
      child: Text("outLine"),
      color: Color(0xffF88B0A),
      highlightColor: Colors.blue,
      textColor: Color(0xff000000),
      borderSide: BorderSide(color: Color(0xff0A66F8), width: 2),
    );

//    var paddingL10 = Padding(
//      padding: EdgeInsets.only(left: 10),
//    );

    var iconBtn = IconButton(
      padding: EdgeInsets.only(),
      onPressed: () {
        print("clicked");
      },
      icon: Icon(Icons.android, size: 40, color: Colors.deepPurpleAccent),
      tooltip: "android",
      highlightColor: Colors.red,
      //点击时间稍长的时候背景渐变到这个颜色
      splashColor: Colors.blue,
      //点击时一闪而过的颜色
      disabledColor: Colors.blueGrey,
    );

    var btnBar = ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[raisedButton, flatButton, outLineButton, iconBtn],
    );

    var textField = TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLines: 1,
      cursorColor: Colors.black,
      cursorWidth: 3,
      style: TextStyle(fontSize: 18, color: Colors.lightBlue,backgroundColor: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: '请输入号码',
        contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(28),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      onChanged: (str) {
        print(str);
      },
      onEditingComplete: () {
        print("onEditingComplete");
      },
      onSubmitted: (str) {
        print("onSubmitted:" + str);
      },
      onTap: () {
        print("onTap");
      },
    );

    var bottomSheet = BottomSheet(
        onClosing: () {},
        builder: (context) => (Container(
            color: Color(0x2fb5f6ff),
            child: Wrap(
              children: <Widget>[
                Container(
                  child: slider,
                  padding: EdgeInsets.only(top: 10, left: 20),
                  width: 300,
                ),


                Row(
                    children: widgets,
                    mainAxisAlignment: MainAxisAlignment.center),

                Container(
                  child: textField,
                  padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                ),

                btnBar,

              ],
            ))));

//    var snackBar = SnackBar(
//        backgroundColor: Color(0xffFB6431),
//        content: Text('Hello!'),
//        duration: Duration(seconds: 1),
//        action: SnackBarAction(
//            label: '确定',
//            onPressed: () {
//              print("Flutter之旅");
//            }));

    var fab = FloatingActionButton(
      //浮动按钮
      onPressed: () {
//        Scaffold.of(scfContext).showSnackBar(snackBar);//这样就行了
        Scaffold.of(scfContext).showBottomSheet(bottomSheet.builder);
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );

    var scaffold = Scaffold(
      //脚手架
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      appBar: AppBar(
        title: Text('Flutter之旅'),
        bottom: tabBar,
      ),
      body: Builder(builder: (context) {
        scfContext = context;
        return tabBarView;
      }),
      floatingActionButton: fab,
    );

    var tabController = DefaultTabController(
        //头部标签容器
        child: scaffold,
        length: tabs.length);

    var app = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: tabController,
    );

    return app;
  }
}
