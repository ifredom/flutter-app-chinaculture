import 'package:chinaculture/pages/home/child/user_data.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/common/fonts_utils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:flutter/material.dart';

class ColumnistPage extends StatefulWidget {
  @override
  _ColumnistPageState createState() => _ColumnistPageState();
}

class _ColumnistPageState extends State<ColumnistPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
  List users = mockUserData;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContainer();
  }

  Widget _buildContainer() {
    return Scaffold(
      body: Container(
        height: 600.0,
        child: CustomScrollView(
          slivers: <Widget>[
            _buildSliverAppBar(),
            SliverFixedExtentList(
              delegate: SliverChildListDelegate(users.map((item) {
                return _buildItem(context, item);
              }).toList()),
              itemExtent: 120.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      actions: <Widget>[
        // _buildAction(),
      ],
      title: Row(
        children: <Widget>[
          ClipOval(
              child: Image.asset(
            "assets/ifredom.jpg",
            height: 48,
            width: 48,
          )),
        ],
      ),
      backgroundColor: Color.fromRGBO(238, 232, 170, 1), // 可设置透明度
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background:
            Image.asset('assets/image/custom/userbg.jpg', fit: BoxFit.cover),
      ),
      pinned: true, //固定导航
      bottom: _buildTabbar(),
    );
  }

  Widget _buildItem(BuildContext context, Map user) {
    return Container(
      height: 200.0,
      margin: const EdgeInsets.only(bottom: 5.0),
      padding: const EdgeInsets.only(left: 10.0),
      color: Colors.blueGrey,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Positioned(
              right: 40.0,
              child: Card(
                child: Center(
                  child: Text(
                    user["name"],
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          ClipRRect(
            child: SizedBox(
              width: 70.0,
              height: 70.0,
              child: Image.asset(
                user["portrait"],
                fit: BoxFit.cover,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ],
      ),
    );
  }

  Widget _buildTabbar() {
    return TabBar(
      labelPadding: EdgeInsets.zero,
      controller: _tabController,
      tabs: <Widget>[
        Tab(
            text: "我的动态",
            icon: Icon(
              FontsUtils.horn,
              size: 32,
              color: HexToColor("#00FFFF"),
            )),
        Tab(
            text: "谁看过我",
            icon: Icon(
              FontsUtils.glasses,
              size: 32,
              color: HexToColor("#FFA500"),
            )),
        Tab(
            text: "会员中心",
            icon: Icon(
              FontsUtils.horn,
              size: 32,
              color: HexToColor("#FFD700"),
            )),
        Tab(
            text: "陌陌钱包",
            icon: Icon(
              FontsUtils.horn,
              size: 32,
              color: HexToColor("#D2691E"),
            )),
      ],
      unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: HexToColor("#F0F8FF")),
      labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: HexToColor("#F0F8FF")),
      indicator: BoxDecoration(),
      onTap: (index) {
        print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("pageONe");
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("PageTwo");
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("PageThree");
  }
}

class PageForth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("PageForth");
  }
}
