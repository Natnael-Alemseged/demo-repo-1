import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  //vasriable to check if password is hidden
  var isPasswordHidden = true;
//Key for the login variables
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  //declare the text controllers
  late TextEditingController emailController, passwordController;
  // declare email and passowrd fields
  var email = '';
  var password = '';

  //changes password visibility when icon is pressed
  void changePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }
  //create instance of email and password controller inside onInit() method by overriding the existing one

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

//delete the email and password controller instances
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Provide valid Email';
    }
    return null;
  }

  validatePassword(String value) {
    if (value.length <= 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }
}
