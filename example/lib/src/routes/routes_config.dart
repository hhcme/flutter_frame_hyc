import 'package:example/src/page/app_home/app_home.dart';
import 'package:example/src/page/first_home/view.dart';
import 'package:example/src/page/second_home/view.dart';
import 'package:flutter/material.dart';

abstract class TestRouterConfig {
  // 此处用于后续通用路由配置
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => AppHomeView(context: context),
    '/first_home': (context) => FirstHomeView(context: context),
    '/second_home': (context) => SecondHomeView(context: context),
  };

  // 配置到MaterialApp的onGenerateRoute中
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final WidgetBuilder? pageBuilder = routes[name];
    if (pageBuilder != null) {
      if (settings.arguments != null) {
        // 带参数路由
        final Route route = MaterialPageRoute(builder: (context) => pageBuilder(context));
        return route;
      } else {
        // 无参数路由
        final Route route = MaterialPageRoute(builder: (context) => pageBuilder(context));
        return route;
      }
    }
    return null;
  }
}
