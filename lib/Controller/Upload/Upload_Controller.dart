import 'dart:io';
import 'package:app/Api/Firebase_ApI.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import '../../Model/Book/book_Model.dart';

class Upload_Controller extends GetxController {
//form state key for upload
  final GlobalKey<FormState> uploadFormKey = GlobalKey<FormState>();
  //instantiate book Model object as observable
  var bookModel = book_Model().obs;
  // text controllers

  TextEditingController bookTitle_Controller = TextEditingController();
  //TextEditingController bookName_Controller = TextEditingController();
  TextEditingController language_Controller = TextEditingController();
  TextEditingController discription_Controller = TextEditingController();
  TextEditingController bookPage_Controller = TextEditingController();

  //text fields
  var bookTitle = '',
      bookName = '',
      language = '',
      discription = '',
      bookPage = '';

  File? image;
  File? book;
  UploadTask? taskBook;
  UploadTask? taskImage;

  //validate fields

  validateForm(String value) {
    if (value.isEmpty) {
      return 'Fields Can not be empty!!!';
    }
    return null;
  }

  //
  Future<bool> checkUpload() {
    final isValid = uploadFormKey.currentState!.validate();
    if (!isValid) {
      return Future<bool>.value(false);
    }
    uploadFormKey.currentState!.save();
    return Future<bool>.value(true);
    ;
  }

  //file
  Future pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
        allowMultiple: false,
      );

      if (result != null) {
        File image = File(result.files.single.path!);
        this.image = image;
      } else {
        // User canceled the picker
      }
    } catch (e) {
      SnackBar(content: Text('error selecting file: $e'));
    }
  }

  Future pickBook() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['docx', 'pdf', 'epub'],
        allowMultiple: false,
      );

      if (result != null) {
        File book = File(result.files.single.path!);
        this.book = book;
      } else {
        // User canceled the picker
      }
    } catch (e) {
      SnackBar(content: Text('error selecting file: $e'));
    }
  }

  Future<bool> uploadButton() async {
    if (this.book == null) {
      Get.snackbar(
          'book must be selected before uploading', 'inavlid file type');
      return Future<bool>.value(false);
    } else if (this.image == null) {
      Get.snackbar('Book Cover Image must be selected before uploading',
          'invalid image');
      return Future<bool>.value(false);
    } else {
      UploadBook();
      return Future<bool>.value(true);
    }
  }

  Future UploadBook() async {
    final bookName = bookTitle_Controller.text;
    final imageName = bookTitle_Controller.text + ' image';
    //
    final bookDestination = '/Books/$bookName';
    final imageDestination = '/bookCovers/$imageName';
    //
    taskBook = (await FirebaseApi.upload(
        bookDestination,
        book!,
        imageDestination,
        image!,
        bookTitle_Controller.text,
        bookPage_Controller.text,
        language_Controller.text,
        discription_Controller.text));
    //taskImage = (await FirebaseApi.uploadimage(imageDestination, image!));
    //
  }

  Future Upload() async {}
}
