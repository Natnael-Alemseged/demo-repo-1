import '../Download/DownloadController.dart';
import 'package:encrypt/encrypt.dart' as enc;
import '../Device/DeviceController.dart';

class encyption {
  static late final myKey = enc.Key.fromUtf8('');
  static final myIv = enc.IV.fromUtf8('');
  static final myEncrypter = enc.Encrypter(enc.AES(myKey));

  encyption() {}
}
