import 'package:app/Controller/Authentication/signupController.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/util/Custom_btn.dart';
/* import 'package:untitled/constants/controllers.dart';
import 'package:untitled/widgets/custom_btn.dart'; */

class SignupWidget extends StatelessWidget {
  SignupWidget({Key? key}) : super(key: key);

  //final _formKey = GlobalKey<FormState>();

  var signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          reverse: true,
          child: Form(
            key: signupController.signupFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SafeArea(
                  child: Container(
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // controller: userController.email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: "First Name",
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: signupController.firstNameController,
                          onSaved: (value) {
                            signupController.firstname = value!;
                          },
                          validator: (value) {
                            return signupController.validateFirstName(value!);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          //controller: signupController.,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: "Last Name",
                          ),
                          textInputAction: TextInputAction.next,
                          controller: signupController.lastNameController,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            signupController.lastname = value!;
                          },
                          validator: (value) {
                            return signupController.validateLastName(value!);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          // controller: userController.email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: "Email",
                          ),
                          controller: signupController.emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            signupController.email = value!;
                          },
                          validator: (value) {
                            return signupController.validateEmail(value!);
                          },
                        ),
                        SizedBox(height: 20),
                        GetBuilder<SignupController>(
                          builder: (signupController) {
                            return TextFormField(
                              obscureText: signupController.isPasswordHidden,
                              controller: signupController.passwordController,
                              onSaved: (value) {
                                signupController.password = value!;
                              },
                              validator: (value) {
                                return signupController
                                    .validatePassword(value!);
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                hintText: "Password",
                                suffix: InkWell(
                                  child: Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    signupController.changePasswordVisibility();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        /* GetBuilder<signupController>(
                            builder: (signupController) {
                              return  */

                        Divider(
                          height: 30,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Custom_btn(
                          buttonLabel: 'Sign Up',
                          onPressed: () async {
                            var x = await signupController.checkSignup();
                            if (x == true) {
                              var y = await signupController.register(
                                  signupController.emailController.text
                                      .toLowerCase(),
                                  signupController.passwordController.text);
                              if (y == Future<bool>.value(true)) {
                                await Get.delete<SignupController>();
                                // Get.offAllNamed('/Home');
                              }
                            } else {}
                          },
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          //onTap: onTap,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Already have an Account?',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                  text: " Log in ",
                                  style: TextStyle(color: Colors.blue[400]),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Get.offAllNamed('/login');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
