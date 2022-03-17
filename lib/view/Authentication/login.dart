import 'package:app/Controller/Authentication/loginController.dart';
import 'package:app/util/Custom_btn.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ForgotPassword.dart';
import 'Signup.dart';
/* import 'package:untitled/constants/controllers.dart';
import 'package:untitled/widgets/custom_btn.dart'; */

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
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
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: TextFormField(
                                // controller: userController.email,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    hintText: "Email"),
                                keyboardType: TextInputType.emailAddress,
                                controller: loginController.emailController,
                                onSaved: (value) {
                                  loginController.email = value!;
                                },
                                validator: (value) {
                                  return loginController.validateEmail(value!);
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              margin: EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.grey.withOpacity(.3),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  child: GetBuilder<LoginController>(
                                      builder: (loginController) {
                                    return TextFormField(
                                      obscureText:
                                          loginController.isPasswordHidden,
                                      // controller: userController.password,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        fillColor: Colors.white,
                                        border: InputBorder.none,
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
                                      controller:
                                          loginController.passwordController,
                                      onSaved: (value) {
                                        loginController.password = value!;
                                      },
                                      validator: (value) {
                                        return loginController
                                            .validatePassword(value!);
                                      },
                                    );
                                  })),
                            ),
                          ],
                        ),
                        Divider(
                          height: 30,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
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
                                          transition: Transition.leftToRight);
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
                      buttonLabel: "Login",
                      onPressed: () {
                        loginController.checkLogin();
                      },
                    ),
                    SizedBox(height: 10),

                    /* ConstrainedBox(
                    
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(),
                        ),
                        onPressed: () {
                          //userController.signIn();
                        }),
                  ), */
                  ],
                ),
              ),
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
                              Get.off(() => SignupWidget());
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
