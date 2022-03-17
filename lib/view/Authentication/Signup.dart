import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/util/Custom_btn.dart';
/* import 'package:untitled/constants/controllers.dart';
import 'package:untitled/widgets/custom_btn.dart'; */

class SignupWidget extends StatelessWidget {
  SignupWidget({Key? key}) : super(key: key);

  //final _formKey = GlobalKey<FormState>();

  //editing controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          reverse: true,
          child: Form(
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
                            hintText: "Usernmae",
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
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
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),

                        /*  GetBuilder<LoginController>(
                            builder: (loginController) {
                              return  */

                        TextFormField(
                          // obscureText: loginController.isPasswordHidden,

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
                                // loginController
                                //.changePasswordVisibility();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        /* GetBuilder<LoginController>(
                            builder: (loginController) {
                              return  */
                        TextFormField(
                          //   obscureText: loginController.isPasswordHidden,

                          // controller: userController.password,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: "Repeat Password",
                            suffix: InkWell(
                              child: Icon(
                                Icons.visibility,
                                color: Colors.grey,
                                size: 20,
                              ),
                              onTap: () {
                                // loginController
                                //     .changePasswordVisibility();
                              },
                            ),
                          ),
                        ),
                        Divider(
                          height: 30,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Custom_btn(
                          buttonLabel: 'Sign Up',
                          onPressed: () {},
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
                                    ..onTap = () {
                                      Get.offNamed('/login');
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
