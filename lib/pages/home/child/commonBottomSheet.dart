import 'package:chinaculture/routers/navigator_utils.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/common/fonts_utils.dart';
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
  final Color _lineColor = Color.fromRGBO(211, 211, 211, 0.2);
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
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          width: screenSize.width * 0.2,
          height: screenSize.width * 0.2,
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.only(left: 8, right: 8),
          child: _buildTargetUserItem(index),
        );
      },
      controller: _scrollController,
    );
  }

  Widget _buildTargetUserItem(int index) {
    Map _itemData = Map();

    switch (index) {
      case 0:
        _itemData["icon"] = "assets/image/ador/ador0.jpg";
        _itemData["name"] = "倾城";

        break;
      case 1:
        _itemData["icon"] = "assets/image/ador/ador1.jpg";
        _itemData["name"] = "陌爱";

        break;
      case 2:
        _itemData["icon"] = "assets/image/ador/ador2.jpg";
        _itemData["name"] = "黑寡妇👄";

        break;
      case 3:
        _itemData["icon"] = "assets/image/ador/ador3.jpg";
        _itemData["name"] = "👑爱无能";
        break;
      case 4:
        _itemData["icon"] = "assets/image/ador/ador4.jpg";
        _itemData["name"] = "......小耳朵..";
        break;
      case 5:
        _itemData["icon"] = "assets/image/ador/ador5.jpg";
        _itemData["name"] = "OVER AGAIN";
        break;
      case 6:
        _itemData["icon"] = "assets/image/ador/ador6.jpg";
        _itemData["name"] = "落幕🍀";
        break;
      case 7:
        _itemData["icon"] = "assets/image/ador/ador7.jpg";
        _itemData["name"] = "不负遇见💕遇见你";
        break;
      default:
        break;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: ClipOval(
            child: Image.asset(
              _itemData["icon"],
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
          ),
        ),
        Gaps.vGap10,
        Text(
          _itemData["name"],
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }

  Widget _buildThirtPart() {
    Size screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          width: screenSize.width * 0.2,
          height: screenSize.width * 0.2,
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.only(left: 8, right: 8),
          child: _buildThirtPartItem(index),
        );
      },
      controller: _scrollController,
    );
  }

  Widget _buildThirtPartItem(int index) {
    Map _itemData = Map();

    switch (index) {
      case 0:
        _itemData["iconData"] = FontsUtils.wechat;
        _itemData["color"] = HexToColor("#46c725");
        _itemData["text"] = "微信";

        break;
      case 1:
        _itemData["iconData"] = FontsUtils.weibo;
        _itemData["color"] = Colors.redAccent;
        _itemData["text"] = "微博";

        break;
      case 2:
        _itemData["iconData"] = FontsUtils.alipay;
        _itemData["color"] = HexToColor("#36adfd");
        _itemData["text"] = "支付宝";

        break;
      case 3:
        _itemData["iconData"] = FontsUtils.pengyouquan;
        _itemData["color"] = Colors.greenAccent;
        _itemData["text"] = "朋友圈";
        break;
      case 4:
        _itemData["iconData"] = FontsUtils.qqzone;
        _itemData["color"] = HexToColor("#fbc235");
        _itemData["text"] = "QQ空间";
        break;
      case 5:
        _itemData["iconData"] = FontsUtils.momo;
        _itemData["color"] = Colors.pink[100];
        _itemData["text"] = "陌陌";
        break;
      default:
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Icon(
            _itemData["iconData"],
            size: 32,
            color: _itemData["color"],
          ),
        ),
        Gaps.vGap10,
        Text(
          _itemData["text"],
          softWrap: false,
          overflow: TextOverflow.fade,
          style: TextStyle(
            decoration: TextDecoration.none, // 文本下横线 双横线
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }
}
