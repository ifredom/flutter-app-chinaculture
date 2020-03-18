import 'package:chinaculture/pages/home/home.dart';
import 'package:chinaculture/utils/common/ScreenUtil.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:chinaculture/widgets/bottombar/bottom_navy_bar.dart/index.dart';
import 'package:chinaculture/widgets/bottombar/circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:chinaculture/widgets/bottombar/circular_bottom_navigation/tab_item.dart';
import 'package:chinaculture/widgets/bottombar/scroll_bottombar.dart/bottombar.dart';
import 'package:chinaculture/widgets/bottombar/scroll_bottombar.dart/bottombar_item.dart';
import 'package:chinaculture/widgets/bottombar/title_nav.dart/title.dart';
import 'package:chinaculture/widgets/bottombar/title_nav.dart/title_item.dart';
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

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    new TabItem(Icons.search, "Search", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.layers, "Reports", Colors.red),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
  ]);
  CircularBottomNavigationController _navigationController;
  double bottomNavBarHeight = 60;

  bool navBarMode = false;

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _navigationController =
        new CircularBottomNavigationController(_currentIndex);

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
    _navigationController.dispose();
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
        bottomNavigationBar: _buildTaNav(),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _currentIndex,
      onTap: _itemTapped,
      // 可选值： fixed 固定 ，shifting 按钮点击移动效果
      type: BottomNavigationBarType.shifting,
      // selectedItemColor:
      //     HexToColor("#0788f0") ?? Theme.of(context).primaryColor,
      // unselectedItemColor: HexToColor("#5e5d65"),
      // backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        print(selectedPos);
        setState(() {
          this._currentIndex = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  Widget _buildNavy() {
    return BottomNavyBar(
      selectedIndex: this._currentIndex,
      showElevation: false,
      itemCornerRadius: 8,
      curve: Curves.easeInBack,
      onItemSelected: (index) => setState(() {
        this._currentIndex = index;
      }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.red,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Users'),
          activeColor: Colors.purpleAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'Messages test for mes teset test test ',
          ),
          activeColor: Colors.pink,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTitleNav() {
    final List<TitledNavigationBarItem> items = [
      TitledNavigationBarItem(title: 'Home', icon: Icons.home),
      TitledNavigationBarItem(title: 'Search', icon: Icons.search),
      TitledNavigationBarItem(title: 'Bag', icon: Icons.card_travel),
      TitledNavigationBarItem(title: 'Orders', icon: Icons.shopping_cart),
    ];

    return TitledBottomNavigationBar(
      onTap: (index) => print("Selected Index: $index"),
      reverse: navBarMode,
      curve: Curves.easeInBack,
      items: items,
      activeColor: Colors.red,
      inactiveColor: Colors.blueGrey,
    );
  }

  Widget _buildTaNav() {
    final List<TaBottombarItem> items = [
      TaBottombarItem(title: '首页', icon: Icon(Icons.home)),
      TaBottombarItem(title: '社区', icon: Icon(Icons.search)),
      // TaBottombarItem(
      //     title: null,
      //     icon: ClipOval(
      //         child: Image.asset(
      //       "assets/ifredom.jpg",
      //       height: 48,
      //       width: 48,
      //     ))),
      TaBottombarItem(title: '专栏', icon: Icon(Icons.card_travel)),
      TaBottombarItem(title: '我的', icon: Icon(Icons.shopping_cart)),
    ];
    return TaBottombar(
      onTapedItem: _itemTapped,
      curve: Curves.easeInBack,
      items: items,
      activeColor: Colors.red,
      inactiveColor: Colors.blueGrey,
    );
  }
}
