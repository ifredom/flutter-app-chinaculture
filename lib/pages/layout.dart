import 'package:chinaculture/pages/home/home.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:flutter/material.dart';

import 'award/award.dart';
import 'columnist/columnist.dart';
import 'community/community.dart';
import 'my/my_index.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController; //需要定义一个Controller
  List<Widget> _list = List();
  List tabData = [
    {'text': '首页', 'icon': Icon(Icons.home)},
    {'text': '社区', 'icon': Icon(Icons.group)},
    {
      'text': null,
      'icon': ClipOval(
          child: Image.asset(
        "assets/ifredom.jpg",
        height: 48,
        width: 48,
      ))
    },
    {'text': '专栏', 'icon': Icon(Icons.view_agenda)},
    {'text': '我的', 'icon': Icon(Icons.account_circle)},
  ];

  List<BottomNavigationBarItem> _myTabs = [];

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: null == tabData[i]['text']
            ? Gaps.empty
            : Text(
                tabData[i]['text'],
              ),
      ));
    }

    _list
      ..add(HomePage())
      ..add(CommunityPage())
      ..add(AwardPage())
      ..add(ColumnistPage())
      ..add(MyPage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    print('screenWidth：$screenWidth , screenWidth:$screenHeight');

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _list,
        ),
        bottomNavigationBar: _buildBottomAppBar(),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomNavigationBar(
      items: _myTabs,
      currentIndex: _currentIndex,
      onTap: _itemTapped,
      // 可选值： fixed 固定 ，shifting 按钮点击移动效果
      type: BottomNavigationBarType.fixed,
      fixedColor: HexToColor("#0788f0") ?? Theme.of(context).primaryColor,
      unselectedItemColor: HexToColor("#5e5d65"),
      backgroundColor: HexToColor("#25282f"),
    );
  }
}
