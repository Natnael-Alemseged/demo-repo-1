import 'package:get/get_state_manager/get_state_manager.dart';

import '../../Common_Components/Firebase/Firebase.dart';

class SignOutController extends GetxController {
  void signOut() async {
    await auth.signOut();
  }
}
