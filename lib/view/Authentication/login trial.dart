import 'package:app/Controller/Authentication/loginController.dart';
import 'package:app/util/Custom_btn.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ForgotPassword.dart';
import 'Signup.dart';
/* import 'package:untitled/constants/controllers.dart';
import 'package:untitled/widgets/custom_btn.dart'; */

class LoginWidget1 extends StatelessWidget {
  LoginWidget1({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());

//  var btn = Custom_btn(buttonLabel: 'Log in');

  //editing controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          reverse: true,
          child: Form(
            key: loginController.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/1.png',
                    ),
                  ),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // controller: userController.email,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              hintText: "Email",
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,

                            controller: loginController.emailController,
                            onSaved: (value) {
                              loginController.email = value!;
                            },
                            validator: (value) {
                              return loginController.validateEmail(value!);
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GetBuilder<LoginController>(
                            builder: (loginController) {
                              return TextFormField(
                                obscureText: loginController.isPasswordHidden,

                                // controller: userController.password,
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
                                      loginController
                                          .changePasswordVisibility();
                                    },
                                  ),
                                ),
                                controller: loginController.passwordController,
                                onSaved: (value) {
                                  loginController.password = value!;
                                },
                                validator: (value) {
                                  return loginController
                                      .validatePassword(value!);
                                },
                              );
                            },
                          ),
                          Divider(
                            height: 30,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                //onTap: onTap,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'forgot password?',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 17.0),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(() => ForgotPasswordWidget(),
                                                transition:
                                                    Transition.leftToRight);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Custom_btn(
                            buttonLabel: "Log in",
                            onPressed: () async {
                              var x = await loginController.checkLogin();

                              if (x == true) {
                                var y = await loginController.login(
                                    loginController.emailController.text.trim(),
                                    loginController.passwordController.text
                                        .trim());

                                if (y == true) {
                                  Get.offAllNamed('/Home');
                                }
                              } else {}
                            },
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            //onTap: onTap,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Dont have an account?',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: " Create Account",
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.offAll(() => SignupWidget());
                                        }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
