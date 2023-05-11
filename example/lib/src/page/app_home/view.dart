import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'logic.dart';

class AppHomeView extends HycFrameView {
  const AppHomeView({BuildContext? context, Key? key})
      : super(key: key, context: context);

  @override
  State<StatefulWidget> createState() => _AppHomeViewState();

  @override
  AppHomeLogic get logic => AppHomeLogic();
}

class _AppHomeViewState extends State<AppHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            controlButton('去第一个页面', () {
              widget.toName('/first_home');
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