import 'package:flutter/material.dart';

import 'bottombar_item.dart';

class TaBottombar extends StatefulWidget {
  int currentIndex;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<TaBottombarItem> items;
  final ValueChanged<int> onTapedItem;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;
  TaBottombar({
    Key key,
    this.currentIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    @required this.items,
    @required this.onTapedItem,
    this.curve = Curves.linear,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onTapedItem != null);
    assert(curve != null);
  }

  @override
  _TaBottombarState createState() => _TaBottombarState();
}

class _TaBottombarState extends State<TaBottombar> {
  static const double BAR_HEIGHT = 60;
  static const double INDICATOR_HEIGHT = 40;
  static const double INDICATO_PADDING = 40;

  Curve get curve => widget.curve;
  List<TaBottombarItem> get items => widget.items;

  Duration duration = Duration(milliseconds: 270);
  double width = 0;
  Color activeColor;

  double _getIndicatorPosition(int index) =>
      (-1 + (2 / (items.length - 1) * index));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    width = size.width;
    activeColor = widget.activeColor ?? Theme.of(context).indicatorColor;
    return Container(
      height: BAR_HEIGHT,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: BAR_HEIGHT / 2 - INDICATOR_HEIGHT / 2,
            width: width,
            child: AnimatedAlign(
              alignment:
                  Alignment(_getIndicatorPosition(widget.currentIndex), 0),
              curve: curve,
              duration: duration,
              child: Container(
                width: width / items.length,
                height: INDICATOR_HEIGHT,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _onTapItem(index),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  _onTapItem(int index) {
    widget.currentIndex = index;
    widget.onTapedItem(widget.currentIndex);

    setState(() {});
  }

  Widget _buildItemWidget(TaBottombarItem item, bool currentIndex) {
    return Container(
      height: BAR_HEIGHT,
      width: (width / items.length),
      child: Center(
        child: Text(
          item.title,
          style: TextStyle(color: widget.activeColor),
        ),
      ),
    );
  }
}
