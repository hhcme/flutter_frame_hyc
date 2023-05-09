library flutter_frame_hyc;

import 'package:flutter/material.dart';

import 'src/route/route.dart';

/// 这里应该是先暴露一些文件
export 'src/file/file.dart';
export 'src/log/log.dart';
export 'src/route/route.dart';
export 'src/storage/storage.dart';

///
/// todo 目前还是不提供自定义启动模块, 初始化就是全功能实现
/// 在APP里面需要先初始化大的类, 初始化就是根据一些参数的结果来决定一些模块是否需要加载

/// 这个初始化目前好像没有什么必要
class FrameOfHYC {
  /// 初始化
  static Future<void> init(BuildContext context) async {
    RouteConfigOfHYC();
  }
}
