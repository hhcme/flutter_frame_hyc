import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';
part 'routes.dart';

class AppPages {
  static final routes = [
    /// 发一波首页
    GetPage(name: _Paths.appHome, page: () => const WaveHomeView(), binding: WaveHomeBinding()),
  ];
}
