import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Authentication/loginController.dart';
import 'package:app/Model/Devices/device_Model.dart';
import 'package:app/Controller/Device/DeviceBox.dart';
import 'package:app/Common_Components/Firebase/Firebase.dart';

class RegisterDevice {
  //
  late String email;
  late int deviceCount;
  //
  RegisterDevice({required this.email});

  checkNumber() async {
    try {
      QuerySnapshot _myDoc = await firestore
          .collection('Users')
          .doc(email)
          .collection('Devices')
          .get();
      List<DocumentSnapshot> _myDocCount = await _myDoc.docs.toList();
      //get number of devices signed in with one account
      deviceCount = await _myDocCount.length;

      //TODO:remove the output code below during production
      print(deviceCount);

      Get.snackbar('Number of Devices is ', deviceCount.toString());
      storeDeviceInfo(deviceCount);
    } catch (e) {
      Get.snackbar(e.toString(), '');
    }
  }

  storeDeviceInfo(int deviceCount) async {
    //get detail from device model
    final mybox = DeviceBox.getDevice();

    final devices = mybox.get(0);
    String? deviceId = devices?.deviceID;
    String? modelName = devices?.modelName;
    String? platformVersion = devices?.platformVersion;
    String? deviceName = devices?.deviceName;
    String? manufacturerName = devices?.manufacturerName;
    String? hardware = devices?.hardware;
    if (deviceCount > 3) {
      await auth.signOut();
    } else if (deviceCount == 0) {
      //Set Primary Device
      firestore
          .collection('Users')
          .doc(email)
          .collection('Devices')
          .doc('Primary Device')
          .set({
        'deviceId': deviceId,
        'modelName': modelName,
        'android Version': platformVersion,
        'manufacturerName': manufacturerName,
        'deviceName': deviceName,
        'hardware': hardware,
      });
    } // else if device is secondary or
    else {
      late String documentName;
      if (manufacturerName != null && deviceName != null) {
        documentName = manufacturerName + " " + deviceName;
      } else {
        documentName = 'Device ' + deviceCount.toString();
      }

      firestore
          .collection('Users')
          .doc(email)
          .collection('Devices')
          .doc(documentName)
          .set({
        'deviceId': deviceId,
        'modelName': modelName,
        'android Version': platformVersion,
        'manufacturerName': manufacturerName,
        'deviceName': deviceName,
        'hardware': hardware,
      });
    }
  }
}
