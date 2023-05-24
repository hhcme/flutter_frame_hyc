import 'dart:async';

import 'package:flutter/material.dart';

/// 弹出小提示
abstract class Toast {
  /// 同时只能存在一个小提示
  static OverlayEntry? _overlayEntry;

  /// 小提示定时到期后消失定时器
  static Timer? _timer;

  static void showBubble(BuildContext context, String txt) {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _timer?.cancel();
      _timer = null;
    }
    _overlayEntry = OverlayEntry(builder: (context) {
      return OverlayWidget(txt);
    });
    var overlayState = Overlay.of(context);
    overlayState.insert(_overlayEntry!);
    _timer = Timer(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _timer?.cancel();
      _timer = null;
    });
  }
}

class OverlayWidget extends StatefulWidget {
  const OverlayWidget(
    this.txt, {
    super.key,
  });

  final String txt;

  @override
  State<OverlayWidget> createState() => _OverlayWidgetViewState();
}

class _OverlayWidgetViewState extends State<OverlayWidget> {
  /// 起始位置
  double bottom = -100.0;

  /// 动画定时器
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    _timer = Timer(const Duration(milliseconds: 200), () {
      setState(() {
        bottom = 0.0;
      });
    });
    return AnimatedPositioned(
      left: 0,
      right: 0,
      bottom: bottom,
      curve: Curves.easeOutBack,
      duration: const Duration(milliseconds: 300),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              widget.txt,
              style: const TextStyle(color: Colors.black45, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    /// 销毁时必须要清除定时器
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
