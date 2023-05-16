import 'dart:async';

import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'state.dart';

class AppHomeLogic{
  AppHomeLogic();

  AppHomeState state = AppHomeState();

  Timer? _timer;


  /// 开启一个定时器
  void start(){
    _timer = Timer(const Duration(seconds: 1), () {
      end();
      state.index++;
      print('${state.index}');
      start();
    });

  }

  /// 销毁定时器
  void end(){
    _timer?.cancel();
    _timer=null;
  }
}
