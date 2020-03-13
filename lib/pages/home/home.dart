import 'package:chinaculture/utils/res/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'child/pageview_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List _tabs = <String>['附近动态', '附近的人', '同城'];
  TabController _tabController;
  // 页面控制器初始化
  double _currentPage = 0.0;
  PageController _pageController = PageController(initialPage: 0);

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
                  flex: 5,
                  child: _buildTabbar(context),
                ),
                Expanded(
                  flex: 2,
                  child: _buildFixedTools(),
                ),
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
      children: _tabs.map((item) => PageviewContent(item: item)).toList(),
    );
  }

  Widget _buildTabbar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: _tabs
          .map((item) => Tab(
                text: item,
              ))
          .toList(),
      unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
      labelStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
      indicator: BoxDecoration(),
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon(Icons.search, size: 30),
        Gaps.hGap40,
        Icon(Icons.format_list_bulleted, size: 30),
      ],
    );
  }
}
