import 'package:app/util/main_copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/Controller/Authentication/loginController.dart';

class Splash extends StatefulWidget {
  //const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final loginController = Get.put(LoginController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeOrLogin();
  }

  _homeOrLogin() async {
    Future.delayed(Duration(milliseconds: 1000), () {
      // title: 'check it out',
      // loginController.initialScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/1.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Splash Screen',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
