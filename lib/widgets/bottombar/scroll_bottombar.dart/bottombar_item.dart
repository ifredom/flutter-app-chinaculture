import 'package:flutter/material.dart';

class TaBottombarItem {
  final String title;
  final Widget icon;
  final Color activeColor;
  final Color inactiveColor;
  TaBottombarItem({
    @required this.title,
    this.icon,
    this.activeColor,
    this.inactiveColor,
  });
}
