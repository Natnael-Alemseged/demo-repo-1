import 'package:app/Controller/Authentication/loginController.dart';
import 'package:app/Controller/Authentication/signupController.dart';
import 'package:app/view/Home_navigation.dart';
import 'package:app/view/Splash/Splash.dart';
import 'package:app/view/Authentication/login%20trial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/view/Uploads.dart';

//import 'package:platform_device_id/platform_device_id.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((Value) {
    Get.put(LoginController());
    Get.put(SignupController());
  });

  runApp(const MyApp());
}

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
        GetPage(name: '/Home', page: () => HomeNavigationWidget()),
        GetPage(name: '/upload', page: () => Uploads()),
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
