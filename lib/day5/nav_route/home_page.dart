import 'package:flutter/material.dart';
import 'package:flutter_journey/iconfont.dart';
import 'package:flutter_journey/toly_widget/goods_widget.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


var scaffold = Scaffold(
  appBar: AppBar(
    title: Text('主页'),
  ),
  body: HomePage(),
);
var app = MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: scaffold,
    routes: <String, WidgetBuilder>{
      "/detail": (BuildContext context) => GoodsDetailPager2(), //详情页路由
      "/logo": (BuildContext context) => FlutterLogo(), //logo路由
    },
  navigatorObservers: [routeObserver,],

);



class HomePage extends StatelessWidget with WidgetsBindingObserver{
  HomePage({Key key}) : super(key: key);


  @override
  void didPopNext() {

  }

  @override
  Widget build(BuildContext context) {
    var goods = GoodsWidget(
        onTap: (goods) {
//          _toDetailPager(context,goods); //跳转到详情界面
//          _toDetailPagerByName(context, goods); //通过路由名称跳转到详情界面
//          _toDetailPagerCloseMe(context,goods);
//          _toDetailPagerByNameCloseMe(context, goods);
//          _toDetailPagerWithDataPush(context, goods);
//          _toDetailPagerWithDataPushNamed(context, goods);

          _toDetailPagerAnim(context, goods);
        },
        width: 200,
        goods: GoodBean(
            price: 21.89,
            saleCount: 99,
            title: "得力笔记本文具商务复古25K/A5记事本PU软皮面日记本子定制可印logo简约工作笔记本会议记录本小清新大学生用",
            image: AssetImage("images/note_cover.jpg")));
    return goods;
  }

  //跳转到详情页
  _toDetailPager(BuildContext context, GoodBean goods) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoodsDetailPager()),
    );
  }

  _toDetailPagerByName(BuildContext context, GoodBean goods) {
    Navigator.of(context).pushNamed("/detail");
  }

  //打开详情页并关闭自己
  _toDetailPagerCloseMe(BuildContext context, GoodBean goods) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GoodsDetailPager()),
    );
  }

  //通过名字打开详情页并关闭自己
  _toDetailPagerByNameCloseMe(BuildContext context, GoodBean goods) {
    Navigator.of(context).pushReplacementNamed("/detail");
  }

  _toDetailPagerWithDataPush(BuildContext context, GoodBean goods) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoodsDetailPager1(goods: goods)),
    );
  }

  //通过名字打开详情页传参并接收返回参数
  _toDetailPagerWithDataPushNamed(BuildContext context, GoodBean goods) {
    Navigator.of(context).pushNamed("/detail", arguments: goods).then((result) {
      print(result);
    });
  }

  _toDetailPagerAnim(BuildContext context, GoodBean goods) {
    Navigator.push(
      context,
      ScaleFadeRotateRouter(child: GoodsDetailPager1(goods: goods)),
    );
  }


  @override /// WidgetsBindingObserver
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        print('AppLifecycleState.paused');
        break;
      case AppLifecycleState.resumed:
        print('AppLifecycleState.resumed');
        break;
      case AppLifecycleState.suspending:
        print('AppLifecycleState.suspending');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}

class GoodsDetailPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var openMe = RaisedButton(
      onPressed: () {
        _toDetailPagerByName(context);
      },
      child: Text('打开自己'),
    );

    var openHome = RaisedButton(
      onPressed: () {
        _toHome(context);
      },
      child: Text('返回主页'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Wrap(
        spacing: 10,
        children: <Widget>[openMe, openHome,      ],

      ),
    );
  }

  //跳转到主页
  void _toHome(BuildContext context) {
//    Navigator.of(context).pushNamed("/");
//    Navigator.of(context).pushNamedAndRemoveUntil("/", ModalRoute.withName('/'));
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }

  _toDetailPagerByName(BuildContext context) {
    Navigator.of(context).pushNamed("/detail");
  }
}

class GoodsDetailPager1 extends StatelessWidget {
  GoodsDetailPager1({Key key, @required this.goods}) : super(key: key);
  final GoodBean goods;

  @override
  Widget build(BuildContext context) {
    var btn = RaisedButton(
      onPressed: () {
        Navigator.pop<String>(context);
      },
      child: Text('返回主页'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(goods.title),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Wrap(
        children: <Widget>[
          Image(
            image: goods.image,
          ),
          Text(goods.title),
          btn,
          Icon(TolyIcon.alipay,color: Colors.blue,size: 50,),
          Icon(TolyIcon.ios,color: Colors.black,size: 50,),
          Icon(TolyIcon.setting,color: Colors.grey,size: 50,),
          Icon(TolyIcon.file_mic,color: Colors.green,size: 50,)
        ],
      ),
    );
  }
}

class GoodsDetailPager2 extends StatelessWidget {
  GoodsDetailPager2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoodBean goods = ModalRoute.of(context).settings.arguments;
    var btn = RaisedButton(
      onPressed: () {
        //返回上一页面并携带数据
        Navigator.pop<String>(context, "朕已阅");
      },
      child: Text('返回主页'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(goods.title),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          Image(
            image: goods.image,
          ),
          Text(goods.title),
          btn
        ],
      ),
    );
  }
}

class LeftRightRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;

  LeftRightRouter({this.child, this.duration_ms = 200})
      : super(
            transitionDuration: Duration(milliseconds: duration_ms),
            pageBuilder: (ctx, a1, a2) {
              return child;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(a1),
                  child: child);
            });
}

class ScaleFadeRotateRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;

  ScaleFadeRotateRouter({this.child, this.duration_ms = 1000}) : super(
            transitionDuration: Duration(milliseconds: duration_ms),
            pageBuilder: (ctx, a1, a2) {return child;},//页面
            transitionsBuilder: (ctx, a1, a2, Widget child,) {//构建动画
              return RotationTransition(//旋转动画
                turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: a1,
                  curve: Curves.fastLinearToSlowEaseIn,
                )),
                child: ScaleTransition(//缩放动画
                  scale: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(parent: a1, curve: Curves.fastLinearToSlowEaseIn)),
                  child: FadeTransition(opacity://透明度动画
                      Tween(begin: 0.5, end: 1.0).animate(a1),
                    child: child,),
                ),
              );
            });
}
