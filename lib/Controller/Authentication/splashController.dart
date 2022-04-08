import 'dart:ffi';

import 'package:app/util/main_copy.dart';
import 'package:app/view/Home_navigation.dart';
import 'package:app/view/Authentication/login.dart';
import 'package:get/get.dart';

class splasController extends GetxController {
  var isLoggedin = false.obs;

  @override
  void onReady() {
    super.onReady();
    _setInitialScreen();
  }

  _setInitialScreen() {
    if (!isLoggedin.value) {
      Get.offAll(() => LoginWidget());
    } else {
      Get.offAll(HomeNavigationWidget());
    }
  }
}
