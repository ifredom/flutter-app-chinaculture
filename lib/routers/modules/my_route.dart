import 'package:chinaculture/pages/my/my_index.dart';
import 'package:fluro/fluro.dart';
import '../router_init.dart';

class MyRouter implements IRouterProvider {
  static String homeworkIndexPage = "/homeworkIndex";
  static String homeworkDetailPage = "/homeworkDetail";

  @override
  void initRouter(Router router) {
    router.define(homeworkIndexPage,
        handler: Handler(handlerFunc: (_, params) => MyPage()));
  }
}
