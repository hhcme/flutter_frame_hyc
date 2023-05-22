import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'logic.dart';

class AppHomeView extends HycFrameView<AppHomeLogic> {
  AppHomeView({required BuildContext context, Key? key}) : super(key: key, context: context, dependency: () => AppHomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            controlButton('去第一个页面', () {
              toNamed('/first_home');
            }),
            SizedBox(
              height: 40,
              child: Text('${logic.state.index}'),
            ),
            controlButton('开启一个定时器', () {
              logic.start();
            }),
            TextButton(
                onPressed: () {
                  print('index -> ${logic.state.index}');
                },
                child: const Text('刷新')),
            controlButton('结束定时器', () {
              logic.end();
            }),
            controlButton('弹窗', () {
              toDialog(Container(width: 30,height: 30,child: const Text('123123123123'),));
            }),
          ],
        ),
      ),
    );
  }

  /// 功能按钮
  Widget controlButton(String title, void Function() func) {
    return SizedBox(
      height: 50,
      child: TextButton(child: Text(title), onPressed: () => func()),
    );
  }
}
