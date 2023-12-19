import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isDark = false;

  void changeTheme(state) {
    if (state == true) {
      isDark = true;
      Get.changeTheme(
        ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          brightness: Brightness.dark,
        ),
      );
    } else {
      isDark = false;
      Get.changeTheme(ThemeData.light());
    }

    update();
  }
}
