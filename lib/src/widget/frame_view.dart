import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/src/route/route.dart';

typedef FrameLogic<S> = S Function();

abstract class LogicMiddle<S> {
  static Map<String, dynamic> logicList = {};

  /// 寻找logic, 找不到会报错
  static S find<S>(String? tag) {
    if (!logicList.containsKey('${S}_tag$tag?')) {
      throw Exception();
    }

    return logicList['${S}_tag$tag?'];
  }

  /// 尝试找一个logic, 找不到会返回空
  static S? tryFind<S>(String? tag) {
    return logicList['${S}_tag$tag?'];
  }

  /// 尝试找一个logic, 找不到会返回空
  static void put<S>(FrameLogic<S> dependency, {String? tag}) {
    logicList.addAll({'${S}_tag$tag?': dependency()});
  }
}

/// page 框架
abstract class HycFrameView<S> extends StatefulWidget {
  HycFrameView({Key? key, required this.context, required this.dependency, this.tag}) : super(key: key) {
    LogicMiddle.put(dependency);
  }

  /// tag唯一标签
  final String? tag;

  final BuildContext context;

  /// 绑定的logic
  final FrameLogic<S> dependency;

  /// 获取logic的方法
  S get logic => LogicMiddle.find<S>(tag);

  /// 页面
  Widget build(BuildContext context);

  @override
  State<HycFrameView> createState() => _HycFrameViewState();

  /// 跳转新页面, 命名路由
  Future<dynamic> toNamed(String name, {dynamic data}) async {
    return await RoutesOfHYC.toNamed(context, name, data: data);
  }

  /// 退出当前路由
  void back({dynamic data}) {
    RoutesOfHYC.back(context, data: data);
  }

  /// 弹出一个弹窗
  Future<dynamic> toDialog(Widget child) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            body: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: child,
                )
              ],
            ),
          );
        });
  }
}

class _HycFrameViewState extends State<HycFrameView> {
  _HycFrameViewState();

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }

  @override
  void initState() {
    super.initState();
    _runTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  /// 刷新定时器
  Timer? _timer;

  /// 每隔50ms就刷新一下页面
  void _runTimer() {
    _timer = Timer(const Duration(milliseconds: 50), () {
      setState(() {});
      _runTimer();
    });
  }
}
