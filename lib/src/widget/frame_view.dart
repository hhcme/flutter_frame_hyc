import 'package:flutter/material.dart';

abstract class HycFrameView<T> extends StatefulWidget {
  const HycFrameView({Key? key, required this.context}) : super(key: key);

  final String? tag = null;

  final BuildContext? context;

  T get logic;

  Future<dynamic> toName(String name, {T? data}) async {
    return await Navigator.pushNamed(context!, name, arguments: data);
  }

  void back({dynamic data}) {
    Navigator.pop(context!, data);
  }

  Future<dynamic> toDialog(WidgetBuilder child) async {
    return await showDialog(context: context!, builder: child);
  }
}
