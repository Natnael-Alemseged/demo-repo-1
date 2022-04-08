import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app/Controller/Upload/Upload_Controller.dart';

class Uploads extends StatefulWidget {
// const Uploads({Key? key}) : super(key: key);

  @override
  State<Uploads> createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
  final uploadController = Get.put(Upload_Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        reverse: true,
        child: Form(
          key: uploadController.uploadFormKey,
          child: Column(
            children: [
              TextFormField(
                // controller: userController.email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Book Title",
                ),
                textInputAction: TextInputAction.next,
                controller: uploadController.bookTitle_Controller,
                onSaved: (value) {
                  uploadController.bookTitle = value!;
                },
                validator: (value) {
                  return uploadController.validateForm(value!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
