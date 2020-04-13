import 'package:chinaculture/ui/pages/home/child/user_data.dart';
import 'package:chinaculture/core/utils/common/color_utils.dart';
import 'package:chinaculture/core/utils/res/gaps.dart';
import 'package:flutter/material.dart';
import 'package:chinaculture/ui/widgets/list/list_refresh.dart'
    as listRefreshCom;

import 'commonBottomSheet.dart';

// 附近得人
class NearbyPersonPageView extends StatefulWidget {
  final item;
  NearbyPersonPageView({this.item});
  @override
  _NearbyPersonPageViewState createState() => _NearbyPersonPageViewState();
}

class _NearbyPersonPageViewState extends State<NearbyPersonPageView> {
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
                Gaps.hGap10,
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: HexToColor("#da4be5"),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: null == item["level"]
                        ? null
                        : Text(item["level"],
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)))
              ],
            ),
            Gaps.vGap5,
            Text("印记：" + item['tags'],
                style: TextStyle(fontSize: 12.0, color: HexToColor('#A6ABB5')))
          ],
        )
      ],
    );
  }

  Widget _buildCardRight(Map item) {
    return RichText(
      text: TextSpan(
          text: '38人·',
          style: TextStyle(fontSize: 10, color: HexToColor('#A6ABB5')),
          children: <TextSpan>[
            TextSpan(
                text: '同城',
                style: TextStyle(fontSize: 12, color: HexToColor('#A6ABB5'))),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
