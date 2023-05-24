import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

import 'logic.dart';

class FirstHomeView extends HycFrameView<FirstHomeLogic> {
  FirstHomeView({required BuildContext context, Key? key}) : super(key: key, context: context, dependency: () => FirstHomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第一封信'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            controlButton('还可以看第二封信', () {
              toNamed('/second_home');
            }),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  'hello呀! 我滴洪洪宝贝儿~',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '好久没给你写信了',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '今天趁着上班摸鱼的时候给你写一封',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '虽然这封信长得有点丑',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '我以后会弄个好看的出来的',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '还记得我们刚认识那会',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '我还在学鸿蒙的时候',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '在电脑上给你打了个hello, 洪英慈',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '今天, 在23-05-24号这一天',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  '我换了一个方式再来和你说一声',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 30,
                child: const Text(
                  'hello, 我的爱人, 洪英慈',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
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
