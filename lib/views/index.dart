import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gsc/common/main_menu.dart';
import 'package:flutter_gsc/common/window_button.dart';
import 'package:flutter_gsc/views/chats.dart';
import 'package:get/get.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(children: [
          LeftSide(
            child: MainMenu(),
          ),
          RightSide()
        ]));
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 55,
        child: Container(
            // 渐变颜色
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(170, 45, 43, 46),
                  Color.fromARGB(170, 50, 49, 49)
                ], // 这里设置您想要的颜色
              ),
            ),
            child: Column(
              children: [
                // WindowTitleBarBox(child: MoveWindow()),
                Expanded(child: child),
              ],
            )));
  }
}

class RightSide extends StatelessWidget {
  //获取当前的点击
  final MainMenuController controller = Get.put(MainMenuController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(alignment: AlignmentDirectional.topStart, children: [
      Container(
          color: Colors.transparent,
          child: Obx(() {
            if (controller.active.value == 'chats') {
              return Chats();
            }

            if (controller.active.value == 'setting') {
              return Container(
                child: Text("设置"),
              );
            }
            return Container();
          })),
      Column(
        children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(
                  child: MoveWindow(),
                ),
                const WindowButtons()
              ],
            ),
          ),
        ],
      ),
    ]));
  }
}
