import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:flutter/material.dart';
import 'package:chinaculture/widgets/list/list_refresh.dart' as listRefreshCom;

class PageviewContent extends StatefulWidget {
  final item;
  PageviewContent({this.item});
  @override
  _PageviewContentState createState() => _PageviewContentState();
}

class _PageviewContentState extends State<PageviewContent> {
  Map _result;
  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    Map<String, dynamic> result = {
      "list": [
        {"name": "小黄", "sex": 25},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
        {"name": "小黑", "sex": 99},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
        {"name": "小红", "sex": 18},
      ],
      'total': 13,
      'pageIndex': 2
    };
    _result = result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Container(
        //   color: Colors.blueGrey,
        //   alignment: AlignmentDirectional.center,
        //   child: Text(widget.item),
        // ),
        new Expanded(
            //child: new List(),
            child: listRefreshCom.ListRefresh(getIndexListData, eachItem))
      ],
    );
  }

  // 单个item
  Widget eachItem(index, item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildCardTop(),
          _buildCardMiddle(),
        ],
      ),
    );
  }

  Widget _buildCardTop() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
                child: Image.asset(
              "assets/ifredom.jpg",
              height: 32,
              width: 32,
            )),
            Gaps.hGap20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "是琪琪呀",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                Gaps.vGap5,
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: HexToColor("#ff77b9"),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.pregnant_woman, size: 12),
                          Gaps.hGap10,
                          Text("18",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                    Gaps.hGap10,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: HexToColor("#da4be5"),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star, size: 12),
                          Gaps.hGap10,
                          Text("65",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        Icon(
          Icons.more_vert,
          size: 20,
        )
      ],
    );
  }

  Widget _buildCardMiddle() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("人生第一次被催婚，我才19岁呀！太难了，不是俺不找，是真找不到，先脱贫，再脱单。"),
          Gaps.vGap10,
          Image.asset(
            "assets/image/custom/girl.jpg",
            fit: BoxFit.fitWidth,
            width: 120,
          )
        ],
      ),
    );
  }
}
