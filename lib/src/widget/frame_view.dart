
  import 'package:flutter/widgets.dart';

abstract class HycFrameView<T> extends StatelessWidget {
  const HycFrameView({Key? key, required this.context}) : super(key: key);

  final String? tag = null;

  final BuildContext? context;

  T get logic => Object<T>();

  @override
  Widget build(BuildContext context);
  }