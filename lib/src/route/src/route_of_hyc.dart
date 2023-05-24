import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/src/route/src/log.dart';
import 'package:flutter_frame_hyc/src/widget/widget.dart';
import 'package:flutter_frame_hyc/src/route/widget/ordinary_dialog.dart';
// import 'package:get/get.dart';

/// 需要有一个可以永久存在的实例用来存储路由信息

/// 使用路由的入口
abstract class RoutesOfHYC {
  /// 暂存路由对象, 用来保管 context
  static Map<String, BuildContext> history = {};

  /// 定时器
  /// 如果这个定时器存在的话, 说明当前路由操作需要丢弃掉
  static Timer? _timer;

  /// 判断能否跳转路由
  static bool isProtect() {
    // if (_timer != null) {
    //   routeLog.logInfo('处在路由保护中,本次路由操作丢弃');
    //   return true;
    // }
    return false;
  }

  /// 跳转命名路由
  static Future<T?>? toNamed<T>(BuildContext context, String name, {T? data}) async {
    if (isProtect()) {
      return null;
    }
    _runTimer();
    history.addAll({name: context});
    return await Navigator.pushNamed(context, name, arguments: data);
  }

  /// 关闭当前路由
  static void back<T>(BuildContext context, {T? data}) {
    // todo 这里还不知道要不要加路由时间保护
    Navigator.pop(context, data);
    history.remove(history.entries.last.key);
  }

  /// 一直退出路由, 直到被打断
  static void until<T>(RoutePredicate predicate) {
    // todo 这里需要做一个默认值就是退到最后一层的 / 路由
    // Get.until(predicate);
    routeLog.logDebug('暂未实现');
  }

  /// 跳转弹窗
  static Future<T?>? toDialog<T>(BuildContext context, Widget child, {T? data, Color? backgroundColor}) async {
    if (isProtect()) {
      return null;
    }
    _runTimer();
    history.addAll({'dialog': context});
    return await showDialog(
        context: context, barrierColor: backgroundColor ?? const Color(0x25000000), builder: (context) => OrdinaryDialog(context, child: child));
  }

  // /// todo 这个东西可以考虑放到ui库里面
  // /// 全屏的转圈加载的动画
  // void showLoading()  {
  //
  // }


  /// 开启路由保护状态定时器
  static void _runTimer() {
    if (_timer != null) {
      routeLog.logInfo('当前处在路由保护中');
      return;
    }

    routeLog.logInfo('路由保护状态开始');
    _timer = Timer(const Duration(milliseconds: 500), () {
      routeLog.logInfo('路由保护状态结束');
      _timer?.cancel();
      _timer = null;
    });
  }
}
