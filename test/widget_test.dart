import 'package:flutter_frame_hyc/src/log/log.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// 测试日志
  testWidgets('log', (WidgetTester tester) async {
    // 日志实例
    final log = LogOfHYC(logName: 'asd');
    log.logDebug('123123');
    log.logInfo('123123');
  });
}
