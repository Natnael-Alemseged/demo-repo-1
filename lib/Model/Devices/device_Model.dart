import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
part 'device_Model.g.dart';

@HiveType(typeId: 0)
class device_Model extends HiveObject {
  @HiveField(0)
  late String deviceID;
  // @HiveField(1)
  // late String? os;
  // @HiveField(2)
  // late String? productName;
  @HiveField(1)
  late String modelName;
  @HiveField(2)
  late String platformVersion;
  @HiveField(3)
  late String deviceName;
  @HiveField(4)
  late String hardware;
  @HiveField(5)
  late String manufacturerName;

  // device_Model(
  //     {this.manufacturerName,
  //     this.modelName,
  //     this.deviceName,
  //     this.platformVersion,
  //     this.deviceID});

  /*  device_Model.fromSnapshot({DocumentSnapshot? documentSnapshot}) {
    deviceID = documentSnapshot!['email'];
    os = documentSnapshot['firstName'];
    name = documentSnapshot['lastName'];
  } */
}
