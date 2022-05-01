import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/Controller/Authentication/loginController.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:hive/hive.dart';
part 'user_Model.g.dart';

@HiveType(typeId: 1)
class user_Model extends HiveObject {
  @HiveField(0)
  late String? email;
  @HiveField(1)
  late String? firstName;
  @HiveField(2)
  late String? lastName;

  user_Model({this.firstName, this.lastName, this.email});

  user_Model.fromSnapshot({DocumentSnapshot? documentSnapshot}) {
    email = documentSnapshot!['email'];
    firstName = documentSnapshot['firstName'];
    lastName = documentSnapshot['lastName'];
    //birthDate = documentSnapshot['birthDate'];
  }

  // ignore: non_constant_identifier_names

}
