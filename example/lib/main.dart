import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/flutter_frame_hyc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('frame测试包'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            controlButton('普通跳命名路由',(){
              RoutesOfHYC.toNamed('');
            }),
          ],
        ),
      ),
    );
  }



  /// 功能按钮
  Widget controlButton(String title, void Function() func){
    return SizedBox(
      height: 50,
      child: TextButton(
          child: Text(title),
          onPressed: () =>func),
    );
  }
}
