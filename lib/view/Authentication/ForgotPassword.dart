import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/util/Custom_btn.dart';
import 'package:app/Controller/Authentication/forgotPassword.dart';
/* import 'package:untitled/constants/controllers.dart';
import 'package:untitled/widgets/custom_btn.dart'; */

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({Key? key}) : super(key: key);

  final forgotPassword = Get.put(ForgotPassword());
  //editing controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reset password'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          reverse: true,
          child: Form(
            key: forgotPassword.forgotpasswordFormKey,
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
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                          controller: forgotPassword.emailController,

                          /*   controller: loginController.emailController,
                            onSaved: (value) {
                              loginController.email = value!;
                            },
                            validator: (value) {
                              return loginController.validateEmail(value!);
                            }, */
                        ),
                        const Divider(
                          height: 25,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                        SizedBox(height: 20),
                        Custom_btn(
                          buttonLabel: 'Reset Password',
                          onPressed: () {
                            forgotPassword.sendpasswordresetemail(
                                forgotPassword.emailController.text);
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
      ),
    );
  }
}
