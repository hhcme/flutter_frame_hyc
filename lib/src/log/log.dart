import 'dart:developer';

import 'package:flutter/foundation.dart';

/// 日志实现
class LogOfHYC {
  LogOfHYC({required String logName}) {
    _logName = logName;
  }

  /// 日志归属
  String _logName = '';

  /// 获取当前时间的字符串 -> 月-日 时:分
  String get _nowTime {
    String time = '';
    // 固化一个当前时间
    final DateTime nowTime = DateTime.now();
    time = '${nowTime.month}-${nowTime.day} ${nowTime.hour}:${nowTime.second}';
    return time;
  }

  /// 调试模式下打印日志
  void debugLog(Object message) {
    if (kDebugMode) {
      debugPrint('debug $_nowTime $_logName : $message');
    }
  }

  /// 任何时候都打印日志
  void infoLog(Object message) {
    log('info $_nowTime $_logName : $message');
    if (kDebugMode) {
      print('info $_nowTime $_logName : $message');
    }
  }
}
