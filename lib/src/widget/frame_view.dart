import 'package:flutter/material.dart';

typedef RefreshFunc = void Function();

/// page 框架
abstract class HycFrameView<T> extends StatefulWidget {
  const HycFrameView({Key? key, required this.context}) : super(key: key);

  final String? tag = null;

  final BuildContext context;

  Future<dynamic> toNamed(String name, {T? data}) async {
    return await Navigator.pushNamed(context, name, arguments: data);
  }

  void back({dynamic data}) {
    Navigator.pop(context, data);
  }

  Future<dynamic> toDialog(WidgetBuilder child) async {
    return await showDialog(context: context, builder: child);
  }
}

abstract class HycFrameLogic<T> {

  void refresh();

  T get logic;
}

// extension HycFrameLogic<T> on State{
//
//   T get logic=> T;
// }
