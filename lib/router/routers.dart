import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template_v3/page/home.dart';
import 'package:flutter_template_v3/page/login/login.dart';

class Routes {
  static FluroRouter? router;

  /// 路由路径
  static String home = "/";
  static String login = "/login";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return;
    });
    router.define(login,
        handler: Handler(handlerFunc: (context, params) => const LoginPage()));
    router.define(home, handler: Handler(handlerFunc: (context, params) {
      // var msg = params['msg']!.first;
      return const HomePage();
    }));
    Routes.router = router;
  }
}
