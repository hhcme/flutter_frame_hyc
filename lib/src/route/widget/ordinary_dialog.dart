import 'package:flutter/material.dart';
import 'package:flutter_frame_hyc/src/route/route.dart';

/// 路由弹窗框架
class OrdinaryDialog extends StatelessWidget{
   const OrdinaryDialog(BuildContext context, {super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: GestureDetector(
          onTap: () {
            // 这里是点击外部空白区域后执行的
            RoutesOfHYC.back(context);
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: child),
                    )),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          // 这里是拦截系统导航返回的
          return false;
        });
  }
}

