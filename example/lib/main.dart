import 'package:example/src/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'frame 测试',
      // todo 这里的主题色还没有定好怎么做
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      initialRoute: '/app_home',
      navigatorObservers: [HycNavigatorObserver()], // 增加路由监听
    );
  }
}
