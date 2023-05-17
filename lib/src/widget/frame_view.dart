import 'dart:async';

import 'package:flutter/material.dart';

typedef FrameLogic<S> = S Function();

abstract class LogicMiddle<S> {
  static Map<String, dynamic> logicList = {};
}

/// page 框架
abstract class HycFrameView<S> extends StatefulWidget {
  HycFrameView({Key? key, required this.context, required this.dependency})
      : super(key: key) {
    LogicMiddle.logicList.addAll({S.toString(): dependency()});
  }

  final String? tag = null;

  final BuildContext context;

  final FrameLogic<S> dependency;

  S get logic => LogicMiddle.logicList[S.toString()] as S;

  Widget build(BuildContext context);

  @override
  State<HycFrameView> createState() => _HycFrameViewState();

  Future<dynamic> toNamed(String name, {dynamic data}) async {
    return await Navigator.pushNamed(context, name, arguments: data);
  }

  void back({dynamic data}) {
    Navigator.pop(context, data);
  }

  Future<dynamic> toDialog(WidgetBuilder child) async {
    return await showDialog(context: context, builder: child);
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

  Timer? _timer;

  void _runTimer() {
    _timer = Timer(const Duration(milliseconds: 100), () {
      setState(() {});
      _runTimer();
    });
  }
}
