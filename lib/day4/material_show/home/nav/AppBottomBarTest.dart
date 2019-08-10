import 'package:flutter/material.dart';

class AppBottomBarTest extends StatelessWidget {
  AppBottomBarTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,//修改位置
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
          <Widget>[
            IconButton(icon: Icon(Icons.home,color: Colors.white,size: 30,),
              onPressed: () {},),
            IconButton(icon: Icon(Icons.style,color: Colors.white,size: 30,),
              onPressed: () {},),
            IconButton(icon: Icon(Icons.search,color: Colors.white,size: 30,),
              onPressed: () {},),
            IconButton(icon: Icon(Icons.email,color: Colors.white,size: 30,),
              onPressed: () {},),
            Opacity(opacity: 0,child:IconButton(icon: Icon(Icons.toys),)),
          ],
        ),
      ),
    );

    return SizedBox(
      height: 60,
      child: scaffold,
    );
  }
}
