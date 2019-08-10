/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/1
/// Time: 下午4:11
/// email: zhu.yan@alibaba-inc.com
/// target: SliverAppBar 的示例

import 'package:flutter/material.dart';

import '../pop_menu.dart';

// SliverAppBar 默认的实例,无状态
class MyMaterialApp extends StatelessWidget {

  final list = <String>[
    "第一章:风云裂变，山河破碎风飘絮",
    "第二章:稚子何去，身世浮沉雨打萍",
    "第三章:大江东去，狂风暴雨掩孤城",
    "第四章:知音何觅，三千剑甲尽归尘",
    "第五章:清风明月，万里江湖无尽期",
    "第一章:风云裂变，山河破碎风飘絮",
    "第二章:稚子何去，身世浮沉雨打萍",
    "第三章:大江东去，狂风暴雨掩孤城",
    "第四章:知音何觅，三千剑甲尽归尘",
    "第五章:清风明月，浊酒一杯家万里",
    "第一章:风云裂变，山河破碎风飘絮",
    "第二章:稚子何去，身世浮沉雨打萍",
    "第三章:大江东去，狂风暴雨掩孤城",
    "第四章:知音何觅，三千剑甲尽归尘",
    "第五章:清风明月，浊酒一杯家万里",
  ];

  @override
  Widget build(BuildContext context) {

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: Icon(
              Icons.android,
              size: 20,
            ),
            //
            title: Text("幻将录"),

            // Toolbar 中主要内容，通常显示为当前界面的标题文字
            actions: <Widget>[PopMenu()],
            // 一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
            //bottom,         //底部内容区域
            elevation: 10,
            //Bar下方阴影
            backgroundColor: Color(0xffcdc5b1),
            // 背景色,APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
            primary: true,
            //是否预留高度
            forceElevated: false,
            automaticallyImplyLeading: true,
            titleSpacing: NavigationToolbar.kMiddleSpacing,
            expandedHeight: 180.0,
            //展开高度
            pinned: true,
            //是否固定在顶部
            flexibleSpace: FlexibleSpaceBar(
                //可以展开区域，通常是一个FlexibleSpaceBar
                centerTitle: true,
                title: Text("   千里巫缨,倾国必倾城",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.asset(
                  'images/wy_300x200_filter.jpg',
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: Center(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 46,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  Icon(
                    Icons.turned_in_not,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10,),
                  Text(list[index],style: TextStyle(fontSize: 16),)
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: list.length,
        ),
      ),
    );
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Icon(listItem.iconData),
        title: Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}
