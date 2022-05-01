import 'package:get/get.dart';
import 'package:hive/hive.dart';
part 'book_Model.g.dart';

@HiveType(typeId: 2)
class book_Model extends HiveObject {
  @HiveField(0)
  late String? bookName;
  @HiveField(1)
  late String? bookPassword;
  @HiveField(2)
  late String? bookImagePath;
}
