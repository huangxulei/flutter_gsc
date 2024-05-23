import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gsc/utils/MyIcons.dart';
import 'package:get/get.dart';

import 'Avatar.dart';

class MainMenu extends StatelessWidget {
  final MainMenuController controller = Get.put(MainMenuController());

  Color textColor = const Color.fromARGB(150, 255, 255, 255);

  String logoPath = "assets/images/logo.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: WindowTitleBarBox(child: MoveWindow()),
        ),
        //图标
        Avatar(
          filePath: logoPath,
          size: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => Container(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: () {
                controller.open('chats'); //点击执行
              },
              child: Icon(
                MyIcons.chat,
                size: 20.0,
                color: controller.active.value == 'chats'
                    ? Color.fromARGB(255, 16, 182, 74)
                    : textColor,
              ),
            ),
          ),
        ),
        Obx(
          () => Container(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: () {
                controller.open('github');
              },
              child: Icon(
                MyIcons.github,
                size: 20.0,
                color: controller.active.value == 'github'
                    ? Color.fromARGB(255, 16, 182, 74)
                    : textColor,
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
        Obx(
          () => Container(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: () {
                controller.open('setting');
              },
              child: Icon(
                Icons.settings,
                size: 20.0,
                color: controller.active.value == 'setting'
                    ? Color.fromARGB(255, 16, 182, 74)
                    : textColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class MainMenuController extends GetxController {
  var active = 'chats'.obs;
  void open(String menu) => {active.value = menu}; //改变当前tab
}
