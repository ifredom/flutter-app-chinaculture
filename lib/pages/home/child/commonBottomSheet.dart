import 'package:chinaculture/routers/navigator_utils.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:flutter/material.dart';

typedef OnItemClickListener = void Function(int index);

class CommonBottomSheet extends StatefulWidget {
  CommonBottomSheet({Key key, this.list, this.onItemClickListener})
      : assert(list != null),
        super(key: key);
  final list;
  final OnItemClickListener onItemClickListener;
  @override
  _CommonBottomSheetState createState() => _CommonBottomSheetState();
}

class _CommonBottomSheetState extends State<CommonBottomSheet> {
  OnItemClickListener onItemClickListener;
  var itemCount;
  double itemHeight = 44;
  var borderColor = Colors.white;
  double _circular = 10;
  final Color _lineColor = Color.fromRGBO(211, 211, 211, 0.5);
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    onItemClickListener = widget.onItemClickListener;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var totalContainer = Container(
      child: _builderContent(),
      height: 260,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_circular),
          topRight: Radius.circular(_circular),
        ),
      ),
    );
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: totalContainer,
        ),
      ],
    );
  }

  Widget _builderContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildTitle(),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: _lineColor)),
            ),
            child: _buildTargetUser(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: _lineColor)),
            ),
            child: _buildThirtPart(),
          ),
        ),
        _buildCancel(),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "分享",
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _buildCancel() {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          "取消",
          textAlign: TextAlign.center,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
      ),
      onTap: () {
        NavigatorUtils.goBack(context);
      },
    );
  }

  Widget _buildTargetUser() {
    Size screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          width: screenSize.width * 0.2,
          height: screenSize.width * 0.2,
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Image.asset(
                  "assets/ifredom.jpg",
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ),
              Gaps.vGap10,
              Text(
                "雷布斯V5872",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        );
      },
      controller: _scrollController,
    );
  }

  Widget _buildThirtPart() {
    Size screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          width: screenSize.width * 0.2,
          height: screenSize.width * 0.2,
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Image.asset(
                  "assets/image/custom/wechat.png",
                  height: 40,
                  width: 40,
                ),
              ),
              Gaps.vGap10,
              Text(
                "微信好友",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        );
      },
      controller: _scrollController,
    );
  }
}
