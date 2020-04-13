import 'package:flutter/material.dart';
import 'package:chinaculture/core/routes/routers.dart';
import 'package:chinaculture/core/services/navigation/navigation_service.dart';

import 'package:chinaculture/core/utils/common/ScreenUtil.dart';
import 'package:chinaculture/locator.dart';

class HomeHomeworkButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: ScreenUtil().setWidth(400),
        height: ScreenUtil().setWidth(145),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/index/ex-btn.png"),
          ),
        ),
      ),
      onTap: () {
        locator<NavigationService>().push(RoutesUtils.homeworkIndexPage);
      },
    );
  }
}
