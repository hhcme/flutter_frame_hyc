import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'logic.dart';

class AppHomeView extends HycFrameView {
  const AppHomeView({required BuildContext context, Key? key})
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
              widget.toNamed('/first_home');
            }),
            Container(
              height: 40,
              child: Text(widget.logic.state.index.toString()),
            ),
            controlButton('开启一个定时器', () {
              widget.logic.start();
            }),
            TextButton(
                onPressed: () {
                  SnackBar(content: Text(widget.logic.state.index.toString()));
                },
                child: const Text('刷新')),
            controlButton('结束定时器', () {
              widget.logic.end();
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
