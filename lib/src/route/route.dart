import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/src/route/log.dart';
import 'package:flutter_frame_hyc/src/route/navigator_observer.dart';
import 'package:get/get.dart';

/// todo 这里的路由还是使用getx来实现先吧
/// 路由动画就需要等等了
/// todo 弹窗和路由的动画和一些基本参数应该要放出来,但是会有一个默认的路由配置文件去控制

/// 使用路由的入口
class RoutesOfHYC {
  /// 定时器
  /// 如果这个定时器存在的话, 说明当前路由操作需要丢弃掉
  Timer? _timer;

  /// 判断能否跳转路由
  bool canPush() {
    if (_timer != null) {
      routeLog.logInfo('处在路由保护中,本次路由操作丢弃');
      return false;
    }
    return true;
  }

  /// 跳转命名路由
  Future<T?>? toNamed<T>(String name, {T? data}) async {
    if (canPush()) {
      return null;
    }
    _runTimer();
    return await Get.toNamed(name,arguments: data);
  }

  /// 跳转弹窗
  Future<T?>? toDialog<T>(Widget widget, {T? data}) async {
    if (canPush()) {
      return null;
    }
    _runTimer();
    return await Get.dialog(widget,arguments: data);
  }

  /// 关闭当前路由
  void back<T>({T? data}) {
    // todo 这里还不知道要不要加路由时间保护
    // if (canPush()) {
    //   return;
    // }
     Get.back(result: data);
  }
  /// 一直退出路由, 直到被打断
  void until<T>(RoutePredicate predicate) {
    // todo 这里需要做一个默认值就是退到最后一层的 / 路由
    Get.until(predicate);
  }

  // /// todo 这个东西可以考虑放到ui库里面
  // /// 全屏的转圈加载的动画
  // void showLoading()  {
  //
  // }
  // /// 底部弹出的小黑窗
  // void showToast()  {
  //
  // }

  /// 开启路由保护状态定时器
  void _runTimer() {
    if (_timer != null) {
      routeLog.logInfo('当前已经处在路由保护中');
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
