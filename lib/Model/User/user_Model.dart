import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/Controller/Authentication/loginController.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class user_Model {
  static const FIRS_TNAME = 'firstName';
  static const LAST_TNAME = 'lastName';
  static const BIRTH_DATE = 'birthDate';
  static const EMAIL = 'email';

  late String? firstName;
  String? lastName;
  //DateTime birthDate;
  String? email;

  user_Model({this.firstName, this.lastName, this.email});

  user_Model.fromSnapshot({DocumentSnapshot? documentSnapshot}) {
    email = documentSnapshot!['email'];
    firstName = documentSnapshot['firstName'];
    lastName = documentSnapshot['lastName'];
    //birthDate = documentSnapshot['birthDate'];
  }

  // ignore: non_constant_identifier_names

}
