import 'package:chinaculture/pages/home/child/user_data.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:flutter/material.dart';
import 'package:chinaculture/widgets/list/list_refresh.dart' as listRefreshCom;

import 'commonBottomSheet.dart';

// 附近得人
class SamecityPageView extends StatefulWidget {
  final item;
  SamecityPageView({this.item});
  @override
  _SamecityPageViewState createState() => _SamecityPageViewState();
}

class _SamecityPageViewState extends State<SamecityPageView> {
  Map _result;
  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    Map<String, dynamic> result = {
      "list": mockUserData,
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
        _buildTopTips(),
        new Expanded(
            //child: new List(),
            child: listRefreshCom.ListRefresh(getIndexListData, eachItem))
      ],
    );
  }

  Widget _buildTopTips() {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
            text: '💓守',
            style: TextStyle(fontSize: 18.0, color: HexToColor('#F08080')),
            children: <TextSpan>[
              TextSpan(
                  text: ' 望',
                  style:
                      TextStyle(fontSize: 18.0, color: HexToColor('#7B68EE'))),
              TextSpan(
                  text: ' 相',
                  style:
                      TextStyle(fontSize: 18.0, color: HexToColor('#F5DEB3'))),
              TextSpan(
                  text: ' 助💓',
                  style:
                      TextStyle(fontSize: 18.0, color: HexToColor('#48D1CC'))),
            ]),
        textAlign: TextAlign.center,
      ),
    );
  }

  // 单个item
  Widget eachItem(index, item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(child: _buildCardLeft(item)),
          _buildCardRight(item),
        ],
      ),
    );
  }

  Widget _buildCardLeft(Map item) {
    return Row(
      children: <Widget>[
        ClipOval(
            child: Image.asset(
          item["portrait"],
          height: 60,
          width: 60,
        )),
        Gaps.hGap20,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item["name"],
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
                      Icon(
                        Icons.pregnant_woman,
                        size: 12,
                        color: Colors.white,
                      ),
                      Gaps.hGap10,
                      Text(item["age"].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ],
                  ),
                ),
              ],
            ),
            Gaps.vGap5,
            Text("k歌中: 爱我还是爱他(中国好声音第四季)",
                style: TextStyle(fontSize: 12.0, color: HexToColor('#A6ABB5')))
          ],
        )
      ],
    );
  }

  Widget _buildCardRight(Map item) {
    return RichText(
      text: TextSpan(
          text: '17人·',
          style: TextStyle(fontSize: 12.0, color: HexToColor('#A6ABB5')),
          children: <TextSpan>[
            TextSpan(
                text: '<=3km',
                style: TextStyle(fontSize: 12.0, color: HexToColor('#A6ABB5'))),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
