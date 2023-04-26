import 'package:flutter_frame_hyc/src/log/log.dart';

/// 这里应该是先暴露一些文件
export 'src/log/log.dart';
export 'src/file/file.dart';
export 'src/storage/storage.dart';
export 'src/route/route.dart';

///
/// todo 目前还是不提供自定义启动模块, 初始化就是全功能实现
/// 在APP里面需要先初始化大的类, 初始化就是根据一些参数的结果来决定一些模块是否需要加载

/// 这个初始化目前好像没有什么必要
class FrameOfHYC {
  /// 初始化
  void init() async {}
}
