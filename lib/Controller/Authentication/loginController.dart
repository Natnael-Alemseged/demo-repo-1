import 'dart:math';

import 'package:app/Common_Components/Firebase/Firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../Device/DeviceController.dart';
import '../../Common_Components/Widgets/Loading.dart';
import '../../Model/User/user_Model.dart';
import '../Device/RegisteDevice.dart';

class LoginController extends GetxController {
//  final deviceController = Get.find<DeviceController>();
  //var deviceController = Get.find<DeviceController>();
  ////////////////////////////////////
  /// backend Controller variables  //
  ///////////////////////////////////
  late Rx<User?> _user;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  var userModel = user_Model().obs;
  RxBool isLoggedIn = false.obs;
  //////////////
  ///
  ///
  /////////////

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
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    email = '';
    password = '';
  }

  //validate that email field accepts valid email type
  validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Provide valid Email';
    }
    return null;
  }

  //check if password is of certain length
  validatePassword(String value) {
    if (value.length <= 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  //upon pressing of the login button this method checks that there are no errors on the form field if so continue with login else show errors and prevent login
  Future<bool> checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return Future<bool>.value(false);
    }
    loginFormKey.currentState!.save();
    return Future<bool>.value(true);
  }

  //////////////////////////////////////////
  //                                      //
  //    Logic To Connect With the Models  //
  //                                      //
  //////////////////////////////////////////

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user will be notified
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/Home');
    }
  }

  Future<bool> login(String email, password) async {
    //email = email.toLowerCase();
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        var registerDevice = await RegisterDevice(email: email);
        await registerDevice.checkNumber();
      });

      // var registerDevice = await RegisterDevice(email: email);
      // await registerDevice.checkNumber();

      return Future<bool>.value(true);
      // ignore: empty_catches
    } catch (firebaseAuthException) {
      dismissLoadingWidget();

      Get.snackbar("Log in Failed : ", firebaseAuthException.toString());
      return Future<bool>.value(false);
    }
  }

  _initializeUserMode(String email) async {
    userModel.value = (await firestore
        .collection('Users')
        .doc(emailController.text.trim())
        .get()
        .then((doc) => user_Model.fromSnapshot(documentSnapshot: doc)));
  }
}
