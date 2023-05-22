import 'dart:async';

import 'state.dart';

class SecondHomeLogic {
  SecondHomeLogic();

  SecondHomeState state = SecondHomeState();

  Timer? _timer;

  /// 开启一个定时器
  void start() {
    if (_timer != null) {
      return;
    }
    _runTimer();
  }

  void _runTimer() {
    _timer = Timer(const Duration(seconds: 1), () {
      state.index++;
      print('${state.index}');
      _runTimer();
    });
  }

  /// 销毁定时器
  void end() {
    _timer?.cancel();
    _timer = null;
  }
}
