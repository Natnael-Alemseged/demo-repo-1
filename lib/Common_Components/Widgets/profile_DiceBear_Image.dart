import 'package:dice_bear/dice_bear.dart';

class profile_DiceBear_Image {
  Uri makeuriImage() {
    final Avatar _avatar = DiceBearBuilder.withRandomSeed().build();
    Uri uri = _avatar.svgUri;
    return uri;
  }
}
