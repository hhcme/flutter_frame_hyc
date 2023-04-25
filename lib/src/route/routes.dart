import 'dart:async';

import 'package:flutter_frame_hyc/src/route/log.dart';

/// 使用路由的入口
class RoutesOfHYC {
  /// 定时器
  /// 如果这个定时器存在的话, 说明当前路由操作需要丢弃掉
  Timer? _timer;

  /// 判断能否跳转路由
  bool canPush() {
    if (_timer != null) {
      routeLog.infoLog('处在路由保护中,本次路由操作丢弃');
      return false;
    }
    return true;
  }

  /// 开启路由保护状态定时器
  void runTimer() {
    if(_timer!=null){
      routeLog.infoLog('当前已经处在路由保护中');
      return;
    }

    routeLog.infoLog('路由保护状态开始');
    _timer = Timer(const Duration(milliseconds: 500), () {
      routeLog.infoLog('路由保护状态结束');
      _timer?.cancel();
      _timer = null;
    });
  }

  /// 直接跳转路由
  ///
  /// 跳转命名路由
  Future<T?>? toNamed<T>(String name) {
    if (canPush()) {
      return null;
    }
  }

  /// 关闭当前路由
  ///
  /// 一直退出路由, 直到被打断
}
