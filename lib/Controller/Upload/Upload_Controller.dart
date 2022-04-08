import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Book/Book_Model.dart';

class Upload_Controller extends GetxController {
//form state key for upload
  final GlobalKey<FormState> uploadFormKey = GlobalKey<FormState>();
  //instantiate book Model object as observable
  var bookModel = Book_Model().obs;
  // text controllers

  TextEditingController bookTitle_Controller = TextEditingController();
  TextEditingController bookName_Controller = TextEditingController();
  TextEditingController language_Controller = TextEditingController();
  TextEditingController discription_Controller = TextEditingController();

  //text fields
  var bookTitle = '', bookName = '', language = '', discription = '';

  //validate fields

  validateForm(String value) {
    if (value.isEmpty) {
      return 'Fields Can not be empty!!!';
    }
    return null;
  }
}
