import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'logic.dart';

class AppHomeView extends HycFrameView<AppHomeLogic> {
  const AppHomeView({BuildContext? context, Key? key}) : super(key: key, context: context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            controlButton('去第一个页面', () {
              RoutesOfHYC.toNamed('/first_home');
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
