import 'package:flutter/material.dart';

abstract class TestRouterConfig {
  // 此处用于后续通用路由配置
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const AppHomePage(),
  };

  // 配置到MaterialApp的onGenerateRoute中
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final WidgetBuilder? pageBuilder = routes[name];
    if (pageBuilder != null) {
      if (settings.arguments != null) {
        // 带参数路由
        final Route route = CustomRoute((context) => pageBuilder(context), settings: settings);
        return route;
      } else {
        // 无参数路由
        final Route route = CustomRoute((context) => pageBuilder(context));
        return route;
      }
    }
    return null;
  }
}
