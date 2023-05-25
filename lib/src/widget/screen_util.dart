import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


ScreenUtil screenUtil = ScreenUtil._instance;

// 使用 context 获取屏幕信息
// 代码中的设置会影响获取的结果
//此类应该放在最顶层
class ScreenWidget extends StatefulWidget {
  final Widget? child;

  const ScreenWidget({Key? key, this.child}) : super(key: key);

  @override
  _ScreenWidgetState createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (ScreenUtil.checkNeedUpdate()) {
      setState(() {});
    }
  }

  @override
  void didChangeTextScaleFactor() {
    if (ScreenUtil.checkNeedUpdate()) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    /*
    在release的模式下,如果在BuildRunOnceEvent使用ScreenUtil.init();的话会出现问题，
        故现在暂时只能在每次build都调用
      //问题出现的issues https://github.com/flutter/flutter/issues/25827
    */
    ScreenUtil.init(context: context);
    return widget.child!;
  }
}

/// 适配屏幕函数
/// [width] 设计稿宽度
/// [height] 设计稿高度
/// [_deviceWidth] 实际设备宽度
/// [_deviceHeight] 实际设备高度
/// [_textScaleFactor] 字体的缩放比例
class ScreenUtil {
  static ScreenUtil _instance = ScreenUtil._();
  /// 这里是iphone14的屏幕分辨率
  static int width = 1170; //设计稿宽度
  static int height = 2532; //设计稿高度
  static double? _deviceWidth; //实际设备宽度
  static double? _deviceHeight; //实际设备高度
  static double? _textScaleFactor; //字体的缩放比例

  ScreenUtil._();

  static bool checkNeedUpdate() {
    final newMediaQuery = MediaQueryData.fromWindow(window);
    return newMediaQuery.size.width != _deviceWidth ||
        newMediaQuery.size.height != _deviceHeight ||
        newMediaQuery.textScaleFactor != _textScaleFactor;
  }

  /// 初始化屏幕参数
  /// 默认从window对象获取，此对象可以认为是操作系统的设置，flutter中的修改对其不生效
  /// 可以传入context参数从当前widget获取
  static void init({BuildContext? context}) {
    late MediaQueryData mediaQuery;
    if (context == null) {
      mediaQuery = MediaQueryData.fromWindow(window);
    } else {
      mediaQuery = MediaQuery.of(context);
    }
    _deviceWidth = min(mediaQuery.size.width, mediaQuery.size.height);
    _deviceHeight = max(mediaQuery.size.width, mediaQuery.size.height);
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  //实际的dp与设计稿px的比例
  static double get scaleWidth => _deviceWidth! / width;

  static double get scaleHeight => _deviceHeight! / height;

  /// 根据设计稿的设备宽度适配
  /// 高度也根据这个来做适配可以保证不变形
  /// 字体size使用 adaptiveFontSize 属性,会间接调用本方法
  double adaptive(double px) => px * scaleWidth;

  /// 根据设计稿的设备高度适配
  double getHeight(double px) => px * scaleHeight;

}
