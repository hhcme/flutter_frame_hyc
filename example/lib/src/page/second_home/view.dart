import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

class SecondHomeView extends StatelessWidget {
  const SecondHomeView({required BuildContext context, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第二个页面'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            controlButton('返回上一级', () {
              RoutesOfHYC.back();
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
      child: TextButton(child: Text(title), onPressed: () => func),
    );
  }
}
