import 'package:flutter/material.dart';
import 'package:chinaculture/ui/pages/user/login.dart';

import 'drawer_user_controller.dart';
import 'home_drawer.dart';

class DrawerExample extends StatefulWidget {
  @override
  _DrawerExampleState createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  AnimationController sliderAnimationController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DrawerUserController(
        screenIndex: DrawerIndex.HOME,
        drawerWidth: MediaQuery.of(context).size.width * 0.75,
        animationController: (AnimationController animationController) {
          sliderAnimationController = animationController;
        },
        screenView: LoginPage(), //任何页面
      ),
    );
  }
}
