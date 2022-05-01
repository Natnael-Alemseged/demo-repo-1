import 'package:app/Controller/Device/DeviceBox.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:device_information/device_information.dart';
import 'package:app/Model/Devices/device_Model.dart';

class DeviceController extends GetxController {
  //var deviceModel = device_Model().obs;
  //
  late String deviceId;
  late var platformVersion;
  late var modelName;
  late var deviceName;
  late var hardware, manufacturerName;

  @override
  void onInit() async {
    print('started');
    await getDEviceId();
    await addDeviceInfo();
    super.onInit();
    print('onInit Completed');
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
    print('Controller Closed');
  }

  @override
  void dispose() {
    super.dispose();
    print('disposed controller');
  }

//TODO:check this code as it might contain a Bug if command couldnt get device< id what will happen?>
  getDEviceId() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = (await (PlatformDeviceId.getDeviceId))!;
      platformVersion = await DeviceInformation.platformVersion;
      modelName = await DeviceInformation.deviceModel;

      deviceName = await DeviceInformation.deviceName;
      hardware = await DeviceInformation.hardware;
      manufacturerName = await DeviceInformation.deviceManufacturer;
    } on PlatformException catch (e) {
      Get.snackbar('Failed to get address ', e.toString());
    }
  }

  addDeviceInfo() async {
    try {
      final deviceModel = device_Model()
        ..manufacturerName = manufacturerName
        ..modelName = modelName
        ..deviceName = deviceName
        ..hardware = hardware
        ..platformVersion = platformVersion
        ..deviceID = deviceId;
      final box = DeviceBox.getDevice();
      box.add(deviceModel);
      print('sucessfully added model to hive db');
    } catch (e) {
      print(e.toString());
    }
  }

  // code below gets additional information abot the android device

/*   Future<bool> checkNumberOfDevices(String email) async {
    try {
      QuerySnapshot _myDoc = await firestore
          .collection('Users')
          .doc(email)
          .collection('Devices')
          .get();
      List<DocumentSnapshot> _myDocCount = await _myDoc.docs.toList();
      //get number of devices signed in with one account
      int deviceCount = _myDocCount.length;
      Get.snackbar('Number of Devices is ', deviceCount.toString());

      if (deviceCount >= 3) {
        return Future<bool>.value(false);
      } else if (deviceCount == 0) {
        //Set Primary Device
        firestore
            .collection('Users')
            .doc('Natiaabaydam@gmail.com')
            .collection('Devices')
            .doc('Primary Device')
            .set({
          'deviceId': _deviceId,
          'imeiNo': _imeiNo,
          'modelName': _modelName,
          'manufacturerName': _manufacturerName,
          'deviceName': _deviceName,
          'productName': _productName,
          'cpuType': _cpuType,
          'hardware': _hardware,
          'apiLevel': _apiLevel
        });
        InitializeDeviceModel('Primary Device');
        return Future<bool>.value(true);
      } else {
        firestore
            .collection('Users')
            .doc('Natiaabaydam@gmail.com')
            .collection('Devices')
            .doc(_manufacturerName + '' + _deviceName)
            .set({
          'deviceId': _deviceId,
          'imeiNo': _imeiNo,
          'modelName': _modelName,
          'manufacturerName': _manufacturerName,
          'deviceName': _deviceName,
          'productName': _productName,
          'cpuType': _cpuType,
          'hardware': _hardware,
          'apiLevel': _apiLevel
        });
        InitializeDeviceModel(_manufacturerName + '' + _deviceName);
        //add Devices
        return Future<bool>.value(true);
      }
    } catch (e) {
      return Future<bool>.value(false);
    }
  }

  InitializeDeviceModel(String docName) async {
    deviceModel.value = (await firestore
        .collection('Users')
        .doc()
        .collection('Devices')
        .doc()
        .get()
        .then((doc) => device_Model.fromSnapshot(documentSnapshot: doc)));
  } */
}
