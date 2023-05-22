import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'logic.dart';
import 'state.dart';

class FirstHomeView extends HycFrameView<FirstHomeLogic> {
  FirstHomeView({required BuildContext context, Key? key}) : super(key: key, context: context, dependency: () => FirstHomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第一个页面'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            controlButton('去第二个页面', () {
              toNamed('/second_home');
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
