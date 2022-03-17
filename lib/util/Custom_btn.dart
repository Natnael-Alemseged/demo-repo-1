// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Custom_btn extends StatelessWidget {
  String buttonLabel;

  final Function onPressed;

  // ignore: non_constant_identifier_names
  Custom_btn({required this.buttonLabel, required this.onPressed});
  //

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        onPressed: () => onPressed(),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          '${buttonLabel}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
