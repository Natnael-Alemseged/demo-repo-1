import 'package:app/util/Splash.dart';
import 'package:app/view/Authentication/login%20trial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:platform_device_id/platform_device_id.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: Text('Hello'),
      initialRoute: '/',

      getPages: [
        GetPage(name: '/', page: () => Splash()),
        GetPage(name: '/login', page: () => LoginWidget1()),
      ],
      /*  routingCallback: (routing) {
        if (routing!.current == '/next') {
         print('what the hell is happning');
        }
      },  */
      //home: LoginWidget(),
      home: Splash(),
    );
  }
}
