import 'package:flutter/widgets.dart';

class device_Model {
  static const DEVICEeID = "id";
  static const Name = "id";
  static const OS = "id";

  final String deviceID;
  final String os;
  final String name;

  device_Model({
    required this.deviceID,
    required this.os,
    required this.name,
  });

//Register device when signing up and set it as primary device
  void Register_Device_firstTime() {}

  //check number of logged in devices in database

  void Check_Number_of_Devices() {}

  //set current device as primary device

  void Set_as_Primary() {}

  //Delete device record from database

  void Delete_Device() {}

  //add device to devices list when signing in/loggin in

  void Add_Device() {}
}
