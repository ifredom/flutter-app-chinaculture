import 'package:chinaculture/routers/modules/my_route.dart';
import 'package:chinaculture/routers/navigator_utils.dart';
import 'package:chinaculture/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  TabController _tabController; //需要定义一个Controller
  List<Widget> _list = List();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // _list
    //   ..add(WidgetPage())
    //   ..add(FourthPage())
    //   ..add(UserPage(userInfo: widget.userInfo));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onAdd() {}

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    print('screenWidth：$screenWidth , screenWidth:$screenHeight');

    return SafeArea(
      child: Scaffold(
          // appBar: CustomAppbar(
          //   title: '首页',
          //   trailingWidget: GestureDetector(
          //     child: Text("homework"),
          //     onTap: () {
          //       NavigatorUtils.push(context, MyRouter.homeworkIndexPage);
          //     },
          //   ),
          // ),
          body: Container(
        child: Text("HOME"),
      )),
    );
  }
}
