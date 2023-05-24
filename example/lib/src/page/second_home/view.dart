import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'logic.dart';

class SecondHomeView extends HycFrameView<SecondHomeLogic> {
  SecondHomeView({required BuildContext context, Key? key}) : super(key: key, context: context, dependency: () => SecondHomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第二封信'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              '想得美哈哈哈哈',
              style: TextStyle(fontSize: 25),
            ),
            const Text(
              '一次只有一封信,',
              style: TextStyle(fontSize: 25),
            ),
            const Text(
              '下次再来看吧',
              style: TextStyle(fontSize: 25),
            ),
            controlButton('回去看第一封信', () {
              back();
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
