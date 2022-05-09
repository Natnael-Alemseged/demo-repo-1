import '../Cryptography Controller/encryption.dart';
import 'package:app/Controller/Cryptography%20Controller/encryption.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:app/Common_Components/Widgets/Loading.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DownloadController extends GetxController {
  //Directory get parent => Directory(parentOf(File));
  Rx<bool> _isGranted = true.obs;
  late Uri book;
  late String bookName;
  late var x;
  late var y;
  //
  void onInit() async {
    await requestStoragePermission();
    x = _localPath;
    y = getExternalVisibleDir;
    //var exportPath = await channel.invokeMethod('getExternalStorageDirectory');
    super.onInit();
  }

  //

  Future<Directory> get _localPath async {
    final directory = await getExternalStorageDirectory();

    Get.snackbar(directory.toString(), 'message');
    return directory!;
  }

  Future<Directory> get getExternalVisibleDir async {
//
    if (await Directory('/storage/emulated/0/MetshafeLogger/Books').exists()) {
      final externalDir = Directory('/storage/emulated/0/MetshafeLogger/Books');
      return externalDir;
    } else {
      await Directory('/storage/emulated/0/MetshafeLogger/Books')
          .create(recursive: true);
      final externalDir = Directory('/storage/emulated/0/MetshafeLogger/Books');
      return externalDir;
    }
  }

  Future downloadFile(
      {required String bookUrl,
      required String bookName,
      required String bookImageUrl}) async {
    try {
      book = Uri.parse(bookUrl);
      this.bookName = bookName;
// we hav estored the directory in variable x and y from the onInit method whcihc calls storage methods

      await canLaunchUrl(book);
      showLoading();
      var resp = await http.get(book);
      //then call the encrypt method

      var encryptResult = _encryptBook(resp.bodyBytes);
      //
      String p = await _writeData(encryptResult, x.path + '/$bookName.aes');
      dismissLoadingWidget();
      Get.snackbar('success', p);
    } catch (e) {
      dismissLoadingWidget();
      Get.snackbar('failed', e.toString());
    }
  }

  _encryptBook(plainString) {
    final encrypted =
        encyption.myEncrypter.encryptBytes(plainString, iv: encyption.myIv);
    return encrypted.bytes;
  }

  Future<String> _writeData(dataToWrite, fileNameWithPath) async {
    Get.snackbar('writing data to Storage', '');
    File bookFile = File(fileNameWithPath);
    await bookFile.writeAsBytes(dataToWrite);
    return bookFile.absolute.toString();
  }

  requestStoragePermission() async {
    if (await Permission.storage.request().isGranted != true) {
      PermissionStatus result = await Permission.storage.request();

      if (result.isGranted) {
        _isGranted = true.obs;
      } else {
        _isGranted = false.obs;
      }
    } else if (await Permission.storage.request().isPermanentlyDenied == true) {
      await openAppSettings();
    }
  }

  // Future<String> readData() async {
  //   try {
  //     final file = await _localFile;
  //     final key = Key.fromLength(32);
  //     final iv = IV.fromLength(16);
  //     final encrypter = Encrypter(AES(key));
  //     String data = await file.readAsString();
  //     final decrypted = encrypter.decrypt16(data, iv: iv);
  //     return decrypted;
  //   } catch (e) {
  //     print(e);
  //     return 'fail';
  //   }
  // }

  // Future<File> writeFile(String data) async {
  //   final file = await _localFile;
  //   final key = Key.fromLength(32);
  //   final iv = IV.fromLength(16);
  //   final encrypter = Encrypter(AES(key));
  //   final encrypted = encrypter.encrypt(data, iv: iv);
  //   return file.writeAsString(encrypted.base16);
  // }

}
