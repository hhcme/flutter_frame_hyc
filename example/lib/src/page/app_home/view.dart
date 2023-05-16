import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'logic.dart';

class AppHomeView extends HycFrameView {
  const AppHomeView({required BuildContext context, Key? key})
      : super(key: key, context: context);

  @override
  State<StatefulWidget> createState() => _AppHomeViewState();

}

class _AppHomeViewState extends State<AppHomeView> implements HycFrameLogic {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            controlButton('去第一个页面', () {
              widget.toNamed('/first_home');
            }),
            SizedBox(
              height: 40,
              child: Text(logic.state.index.toString()),
            ),
            controlButton('开启一个定时器', () {
              logic.start();
            }),
            TextButton(
                onPressed: () {
                  refresh();
                  SnackBar(content: Text(logic.state.index.toString()));
                },
                child: const Text('刷新')),
            controlButton('结束定时器', () {
              logic.end();
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

  @override
  AppHomeLogic get logic => AppHomeLogic();

  @override
  void refresh() {
    setState(() {

    });
  }
}
