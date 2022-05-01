import 'package:app/Common_Components/Firebase/Firebase.dart';
import 'package:app/Model/User/user_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Common_Components/Widgets/Loading.dart';

class SignupController extends GetxController {
  late Rx<User?> _user;

  //
  //initialize user model
  var userModel = user_Model().obs;
  //
  late TextEditingController emailController,
      passwordController,
      firstNameController,
      lastNameController;
  //
  var isPasswordHidden = true;
  //
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // declare email and passowrd fields
  var email = '';
  var password = '';
  var lastname = '';
  var firstname = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    passwordController = TextEditingController();
  }

//delete the email and password controller instances
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  //changes password visibility when icon is pressed
  void changePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

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

  validateFirstName(String value) {
    if (value.isEmpty) {
      return 'Enter your First Name';
    }
    return null;
  }

  validateLastName(String value) {
    if (value.isEmpty) {
      return 'Enter your Last Name';
    }
    return null;
  }

  //upon pressing of the login button this method checks that there are no errors on the form field if so continue with login else show errors and prevent login
  Future<bool> checkSignup() {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return Future<bool>.value(false);
    }
    signupFormKey.currentState!.save();
    return Future<bool>.value(true);
    ;
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
  }

  Future<bool> register(String email, password) async {
    var users;
    try {
      showLoading();

      await auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) => users = FirebaseAuth.instance.currentUser!)
          .then((value) async => await users.sendEmailVerification())
          .then((value) => firestore
                  .collection('Users')
                  .doc(emailController.text.toLowerCase())
                  .set({
                'firstName': firstNameController.text.trim(),
                'lastName': lastNameController.text.trim(),
                'email': email
              }))
          //next we
          .then((value) => firestore.collection('Users').doc(email).set({
                'firstName': firstNameController.text.trim(),
                'lastName': lastNameController.text.trim(),
                'email': email
              }))
          //next we create the Devices Collection to store the number of devices
          .then((value) =>
              firestore.collection('Users').doc(email).collection('Devices'));
      _initializeUserMode(email);
      return Future<bool>.value(true);
    } catch (firebaseAuthException) {
      dismissLoadingWidget();
      Get.snackbar("failed to register: ", firebaseAuthException.toString());
      return Future<bool>.value(false);
    }
  }

  _initializeUserMode(String email) async {
    userModel.value = (await firestore
        .collection('Users')
        .doc(email)
        .get()
        .then((doc) => user_Model.fromSnapshot(documentSnapshot: doc)));
  }
}
