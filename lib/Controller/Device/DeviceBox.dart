import 'package:app/Model/Devices/device_Model.dart';
import 'package:hive/hive.dart';
// ignore: file_name

class DeviceBox {
  static Box<device_Model> getDevice() => Hive.box<device_Model>('device');
}
