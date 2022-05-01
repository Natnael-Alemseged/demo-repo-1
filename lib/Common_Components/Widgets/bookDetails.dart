import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app/Controller/Download/DownloadController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

var download = Get.put(DownloadController());
Widget bookDetails({required DocumentSnapshot snapshot}) => Scaffold(
    appBar: AppBar(
      title: Text(
        snapshot['bookTitle'],
      ),
    ),
    body: Column(
      children: [
        Container(
          //width: 50,
          child: ElevatedButton.icon(
            onPressed: () async {
              // await download.downloadFile(
              //     bookUrl: snapshot['bookUrl'],
              //     bookName: snapshot['bookTitle'],
              //     bookImageUrl:snapshot['bookCover']);
            },
            icon: Icon(Icons.download),
            label: Text('download'),
          ),
        ),
      ],
    ));
