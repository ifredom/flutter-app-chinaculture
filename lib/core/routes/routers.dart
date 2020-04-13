import 'package:chinaculture/ui/pages/layout.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:chinaculture/ui/pages/404.dart';
import 'package:chinaculture/ui/pages/home/home.dart';
import 'package:chinaculture/ui/pages/user/login.dart';
import 'package:chinaculture/ui/pages/user/login_phone.dart';

/// 路由跳转使用方式
// locator<NavigationService>().push(RoutesUtils.homePage);

class RoutesUtils {
  static Router router;
  static const String rootPage = 'app://';
  static const String homePage = 'app://homePage';
  static const String loginPage = "app://loginPage";
  static const String loginPhonePage = "app://loginPhonePage";

  static Route<dynamic> generateRoute(
    BuildContext context,
    RouteSettings settings,
  ) {
    return platformPageRoute(
      context: context,
      settings: RouteSettings(name: settings.name),
      builder: (context) => _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {
      case rootPage:
        return LayoutPage();
      case homePage:
        return HomePage();

      case loginPage:
        return LoginPage();
      case loginPhonePage:
        return LoginPhonePage();

      // case freemodeBooklistPage:
      //   final Teachingbook post = settings.arguments as Teachingbook;
      //   return FreeModeBooklist(book: post);

      default:
        return WidgetNotFound();
    }
  }

  // Add routes that should behave as fullScreenDialogs
  static final _fullScreenDialogs = [
    // Routes.route_1,
    // Routes.route_2,
  ];
}
