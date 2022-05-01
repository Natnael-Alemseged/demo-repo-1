import 'package:app/Controller/Authentication/loginController.dart';
import 'package:app/Controller/Authentication/signupController.dart';
import 'package:app/view/Home_navigation.dart';
import 'package:app/view/Splash/Splash.dart';
import 'package:app/view/Authentication/login%20trial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/view/Uploads.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Controller/Device/DeviceController.dart';
import 'Model/Book/book_Model.dart';
import 'Model/Devices/device_Model.dart';
import 'Model/User/user_Model.dart';

//import 'package:platform_device_id/platform_device_id.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await Firebase.initializeApp();

  await Hive.initFlutter();
  //
  Hive.registerAdapter(deviceModelAdapter());
  await Hive.openBox<device_Model>('device');
  Hive.registerAdapter(userModelAdapter());
  await Hive.openBox<user_Model>('user');
  Hive.registerAdapter(bookModelAdapter());
  await Hive.openBox<book_Model>('books');
  //
  await Get.put(DeviceController);
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
