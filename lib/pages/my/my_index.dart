import 'package:chinaculture/pages/home/child/user_data.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/common/fonts_utils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
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
    return _buildNestedScrollView();
  }

  Widget _buildNestedScrollView() {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 700.0,
      child: Scaffold(
        body: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text(
                    'Ifredom',
                    style: TextStyle(color: Colors.white),
                  ),
                  pinned: true,
                  floating: true,
                  forceElevated: boxIsScrolled,
                  expandedHeight: 140.0,
                  flexibleSpace: Container(
                    child: Image.asset(
                      'assets/image/custom/userbg.jpg',
                      width: _screenSize.width * 0.25,
                      repeat: ImageRepeat.repeat,
                      height: 140.0,
                    ),
                  ),
                )
              ];
            },
            body: Container(
              child: Text('123'),
            )),
      ),
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
