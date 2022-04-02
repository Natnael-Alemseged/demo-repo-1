import 'package:app/Common_Components/Firebase/Firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Common_Components/Widgets/Loading.dart';

class ForgotPassword extends GetxController {
  //define the global key for the form
  final GlobalKey<FormState> forgotpasswordFormKey = GlobalKey<FormState>();
  //the controller that holds the value accpeted by the email form field
  late TextEditingController emailController;
  //initialize the email controller
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

//send verification email then redirect to login screen
  void sendpasswordresetemail(String email) async {
    try {
      showLoading();
      await auth.sendPasswordResetEmail(email: email).then((value) {
        print(email);
        Get.offAllNamed('login');
        Get.snackbar(
            "Password Reset email link is been sent to: $email", "Success");
      });
    } catch (onError) {
      (onError) => Get.snackbar("Error In Email Reset", onError.message);
    }
  }
}
