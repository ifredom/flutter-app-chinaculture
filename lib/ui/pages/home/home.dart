import 'package:chinaculture/core/utils/common/color_utils.dart';
import 'package:chinaculture/core/utils/res/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'child/dynamic_pageview.dart';
import 'child/nearby_person_pageview.dart';
import 'child/samecity_pageview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List _tabs = <String>['附近动态', '附近的人', '同城'];
  TabController _tabController;
  // 页面控制器初始化
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // 注意顺序
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: _buildTabbar(context),
                ),
                Spacer(
                  flex: 1,
                ),
                _buildFixedTools(),
              ],
            ),
            Expanded(
              flex: 1,
              child: _buildPageView(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        DynamicPageView(),
        NearbyPersonPageView(),
        SamecityPageView(),
      ],
    );
  }

  Widget _buildTabbar(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.zero,
      controller: _tabController,
      tabs: _tabs
          .map((item) => Tab(
                child: Text(item, softWrap: false, overflow: TextOverflow.fade),
              ))
          .toList(),
      unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
      labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
      indicator: BoxDecoration(),
      onTap: (index) {
        print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      // indicatorColor: HexToColor("#1f5190"),
      // indicator: new ShapeDecoration(
      //   shape: new Border(
      //     bottom: BorderSide(
      //       width: 5.0,
      //       color: HexToColor("#1f5190"),
      //     ),
      //   ),
      // ),
      // indicatorSize: TabBarIndicatorSize.label,
    );
  }

  Widget _buildFixedTools() {
    print(_currentPageIndex);
    print(_tabController.index);

    Widget _dynamicButton = Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          color: HexToColor("#33d4ff"),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          )),
      child: Text(
        "发动态",
        style: TextStyle(color: Colors.white),
      ),
    );

    Widget _screenButton = GestureDetector(
      child: Container(
        child: Icon(Icons.directions_subway, size: 24),
      ),
      onTap: () {},
    );

    Widget _roomButton = Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          color: HexToColor("#15e2c1"),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          )),
      child: Text(
        "建房间",
        style: TextStyle(color: Colors.white),
      ),
    );

    Widget result = _dynamicButton;
    switch (_tabController.index) {
      case 0:
        result = _dynamicButton;
        break;
      case 1:
        result = _screenButton;
        break;
      case 2:
        result = _roomButton;
        break;
      default:
        break;
    }
    return result;
  }
}
