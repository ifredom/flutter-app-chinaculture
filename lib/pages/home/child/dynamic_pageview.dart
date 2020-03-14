import 'package:chinaculture/pages/home/child/user_data.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:flutter/material.dart';
import 'package:chinaculture/widgets/list/list_refresh.dart' as listRefreshCom;

import 'commonBottomSheet.dart';

// 附近动态
class DynamicPageView extends StatefulWidget {
  final item;
  DynamicPageView({this.item});
  @override
  _DynamicPageViewState createState() => _DynamicPageViewState();
}

class _DynamicPageViewState extends State<DynamicPageView> {
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
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildCardTop(item),
          _buildCardMiddle(item),
        ],
      ),
    );
  }

  Widget _buildCardTop(Map item) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
                child: Image.asset(
              item["portrait"],
              height: 32,
              width: 32,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
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
                          Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.orangeAccent,
                          ),
                          Gaps.hGap10,
                          Text(item["anchorLevel"],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        GestureDetector(
            child: Icon(
              Icons.more_vert,
              size: 20,
            ),
            onTap: () {
              showDialog(
                  barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
                  context: context,
                  builder: (BuildContext context) {
                    var list = List();
                    list.add('相册');
                    list.add('相机');
                    list.add('保存图片');
                    return CommonBottomSheet(
                      list: list,
                      onItemClickListener: (index) async {
                        Navigator.pop(context);
                      },
                    );
                  });
            })
      ],
    );
  }

  Widget _buildCardMiddle(Map item) {
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
