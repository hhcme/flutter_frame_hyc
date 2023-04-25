import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_frame_hyc/src/log/log.dart';

/// 使用路由的入口
class RoutesOfHYC {

  /// 直接跳转路由
  ///
  /// 跳转命名路由
  Future<T?>? toNamed<T>(
      String name, {
        dynamic arguments,
        int? id,
        bool preventDuplicates = true,
        Map<String, String>? parameters,
      }) {
    if (preventDuplicates && page == currentRoute) {
      return null;
    }

    /// 加路由切换时间保护锁
    if (!IRouteTimeProtect.instance.tryProtect(RouteDirection.forward, page)) {
      return null;
    }

    if (parameters != null) {
      final uri = Uri(path: page, queryParameters: parameters);
      page = uri.toString();
    }

    return global(id).currentState?.pushNamed<T>(
      page,
      arguments: arguments,
    );
  }
  /// 关闭当前路由
  ///
  /// 一直退出路由, 直到被打断
}
