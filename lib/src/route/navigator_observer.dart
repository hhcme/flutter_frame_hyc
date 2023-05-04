
import 'package:flutter/material.dart';

/// 如果在这里做路由栈的保存,那就只能放在全局变量里面才能使用了
class HycNavigatorObserver extends NavigatorObserver {
  /// 存放路由栈
  static List<Route> history = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    history.add(route);
    //添加了一个新路由到历史记录中
    //弹窗的路由也会触发
    debugPrint('didPush: ${route.settings.name}');
    debugPrint('添加了一个新路由到历史记录中');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    history.remove(route);
    //从历史记录中弹出当前路由
    //可以理解为就是当前路由监听到切换回自己的时候触发
    debugPrint('didPop: ${route.settings.name}');
    debugPrint('从历史记录中弹出当前路由,应该更新路由页面');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    history.remove(route);
    //从历史记录中移除了一个路由
    debugPrint('didRemove: ${route.settings.name}');
    debugPrint('从历史记录中移除了一个路由');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    history.remove(oldRoute);
    if (newRoute != null) history.add(newRoute);
    //路由替换
    debugPrint('didReplace: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}');
    debugPrint('路由替换');
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    // 这里还不知道功能, 对于外部来说还是暂时使用 get本身的路由查询吧
    // history.remove(route);
    //当用户开始操作新的路由时被调用，例如手势拖动等，触发了路由转换
    debugPrint('didStartUserGesture: ${route.settings.name}');
    debugPrint('当用户开始操作新的路由时被调用，例如手势拖动等，触发了路由转换');
  }

  @override
  void didStopUserGesture({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    history.remove(oldRoute);
    if (newRoute != null) history.add(newRoute);
    //当用户结束操作新的路由时被调用
    debugPrint('didReplace: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}');
    debugPrint('当用户结束操作新的路由时被调用');
  }
}
