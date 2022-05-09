import 'package:app/Model/User/user_Model.dart';
import 'package:hive/hive.dart';
// ignore: file_name

class UserBox {
  static Box<user_Model> getUser() => Hive.box<user_Model>('user');
}
