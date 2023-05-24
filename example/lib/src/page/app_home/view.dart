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
            controlButton('查看第一封信', () {
              toNamed('/first_home');
            }),
            Center(
              child: SizedBox(
                height: 40,
                child: Text(
                  '${logic.state.index}',
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
            controlButton('老公给你数个数', () {
              logic.start();
            }),
            controlButton('老公累了, 待一会再数数', () {
              logic.end();
            }),
            controlButton('猜一下点这里会弹出来什么', () {
              toDialog(const Text('么么么么么么么么么么'));
            }),
            controlButton('点这里送老婆一颗小心心', () {
              showToast('\u2764\ufe0f');
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
