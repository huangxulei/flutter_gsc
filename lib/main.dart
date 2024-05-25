import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_gsc/views/index.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: Index());
  }
}
