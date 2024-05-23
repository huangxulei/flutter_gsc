import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_gsc/common/main_menu.dart';
import 'package:flutter_gsc/views/chats_view.dart';
import 'package:get/get.dart';

import 'common/window_button.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  // 判断是否是Linux 设置主题样式
  if (!Platform.isLinux) {
    // 判断是Windows10 1803以上版本
    if (Platform.isWindows) {
      await Window.setEffect(
        // effect: WindowEffect.acrylic,
        effect: WindowEffect.solid,
        color: Colors.transparent,
      );

      if (Platform.operatingSystemVersion.contains('(')) {
        print(Platform
            .operatingSystemVersion); //"Windows 10 Pro" 10.0 (Build 19045)
        var version = Platform.operatingSystemVersion
            .split('(')[1]
            .split(')')[0]
            .toLowerCase()
            .replaceAll('build', '')
            .trim();
        if (int.parse(version) > 19045) {
          await Window.setEffect(
            effect: WindowEffect.acrylic,
            color: Colors.transparent,
          );
        }
      }
    } else {
      await Window.setEffect(
        effect: WindowEffect.acrylic,
        color: Colors.transparent,
      );
    }
  }
  //设置界面大小
  appWindow.size = const Size(1000, 650);
  runApp(const MyApp());
  appWindow.show();
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1080, 670);
    win.minSize = initialSize;
    win.size = appWindow.size;
    win.alignment = Alignment.center;
    win.title = "古诗词";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(children: [
              LeftSide(
                child: MainMenu(),
              ),
              RightSide()
            ])));
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
              return ChatsView();
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
