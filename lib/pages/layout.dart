import 'package:chinaculture/pages/home/home.dart';
import 'package:chinaculture/utils/common/ScreenUtil.dart';
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
  List<Widget> _list = List();
  List<BottomNavigationBarItem> _bottomTabs = [];

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

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < tabData.length; i++) {
      _bottomTabs.add(
        BottomNavigationBarItem(
          icon: tabData[i]['icon'],
          title: null == tabData[i]['text']
              ? Gaps.empty
              : Text(
                  tabData[i]['text'],
                ),
        ),
      );
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
    /// 初始化屏幕适配.必须放在第一个页面
    ScreenUtil.instance =
        ScreenUtil(designDraftWidth: 1920, designDrafHeight: 1080)
          ..init(context);

    return SafeArea(
      child: Scaffold(
        // indexedStack 不带动画
        body: IndexedStack(
          index: _currentIndex,
          children: _list,
        ),
        // body: HomePage(),
        bottomNavigationBar: _buildBottomAppBar(),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _currentIndex,
      onTap: _itemTapped,
      // 可选值： fixed 固定 ，shifting 按钮点击移动效果
      type: BottomNavigationBarType.fixed,
      selectedItemColor:
          HexToColor("#0788f0") ?? Theme.of(context).primaryColor,
      unselectedItemColor: HexToColor("#5e5d65"),
      backgroundColor: HexToColor("#25282f"),
    );
  }
}
