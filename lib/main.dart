import 'package:flutter/material.dart';

import 'day7/goods.dart';

void main() {
  runApp(MaterialApp(
    title: '页面跳转',
    home: HomePager(),
    routes: {
      "/detail": (context) => GoodsDetailPager(),
      "/home": (context) => HomePager(),
    },
  ));
}


class HomePager extends StatelessWidget {

  slideTransition(Animation<double> animation, Animation<double> secondaryAnimation,Widget child) {

    return SlideTransition(
      position:  Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: SlideTransition(
        position:  Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.0, 1.0),
        ).animate(secondaryAnimation),
        child: child,
      ),
    );


//    var anim = new Tween<Offset>(
//      begin: const Offset(1.0, 0.0),
//      end: const Offset(0.0, 0.0),
//    ).animate(animation);
//
//    return SlideTransition(
//      position: anim,
//      child: child,
//    );
  }

  @override
  Widget build(BuildContext context) {
    var goods = Goods(
        onTap: (goods) {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      GoodsDetailPager(goodBean: goods,),

                  transitionsBuilder: (context, animation, secondaryAnimation,
                      child,) {

                    return slideTransition(animation, secondaryAnimation,child);
                  }));


//        Navigator.of(context).pushNamed('/detail');
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => GoodsDetailPager(goodBean: goods,)),
//        ).then((value)=>print(value));
        },
        width: 200,
        goods: GoodBean(
            price: 21.89,
            saleCount: 99,
            title: "得力笔记本文具商务复古25K/A5记事本PU软皮面日记本子定制可印logo简约工作笔记本会议记录本小清新大学生用",
            caverUrl: "https://img.alicdn.com/imgextra/i3/108452043/O1CN01IMPSxR1QxjhmdZLXA_!!0-saturn_solar.jpg_220x220.jpg_.webp"));

    return Scaffold(
        appBar: AppBar(
          title: Text('主页'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: goods
    );
  }
}

class GoodsDetailPager extends StatelessWidget {

  GoodsDetailPager({Key key, @required this.goodBean}) : super(key: key);
  final GoodBean goodBean;

  @override
  Widget build(BuildContext context) {
    var btn = RaisedButton(
      onPressed: () {
//            Navigator.of(context).pushNamed('/home');
        Navigator.pop(context, "我已经浏览完毕");
//          Navigator.of(context).pop();
      },
      child: Text('返回主页'),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text(goodBean.title),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(children: <Widget>[
        Image.network(goodBean.caverUrl),
        Text(goodBean.title),
        btn
      ],),
    );
  }
}