import 'package:flutter_cache_manager/file.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app/Controller/Upload/Upload_Controller.dart';
import 'package:http/http.dart';

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
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Book Title',
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
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
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    onPressed: uploadController.pickBook,
                    label: Text('Select Book'),
                    icon: Icon(Icons.book),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        uploadController.pickImage();
                      });
                    },
                    icon: Icon(Icons.camera_alt_outlined),
                    label: Text('Select Book Cover'),
                  ),
                  Spacer(),
                  uploadController.image != null
                      ? Image.file(uploadController.image!,
                          width: 80, height: 80, fit: BoxFit.cover)
                      : FlutterLogo(
                          size: 80,
                        )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Book Page',
                  prefixIcon: Icon(Icons.pages),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                textInputAction: TextInputAction.next,
                controller: uploadController.bookPage_Controller,
                onSaved: (value) {
                  uploadController.bookPage = value!;
                },
                validator: (value) {
                  return uploadController.validateForm(value!);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Book Language',
                  prefixIcon: Icon(Icons.language),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                textInputAction: TextInputAction.next,
                controller: uploadController.language_Controller,
                onSaved: (value) {
                  uploadController.language = value!;
                },
                validator: (value) {
                  return uploadController.validateForm(value!);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Enter Book Discription',
                  prefixIcon: Icon(Icons.newspaper),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                controller: uploadController.discription_Controller,
                onSaved: (value) {
                  uploadController.discription = value!;
                },
                validator: (value) {
                  return uploadController.validateForm(value!);
                },
              ),
              Divider(
                height: 30,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  var x = await uploadController.checkUpload();

                  var y = await uploadController.uploadButton();
                  if (y == true) {
                    await Get.snackbar('Success', 'Upload was successfull!!!');
                    Get.toNamed('/Home');
                  }
                },
                icon: Icon(Icons.upload_file),
                label: Text('Upload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
