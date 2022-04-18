import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
            onPressed: () {},
            icon: Icon(Icons.download),
            label: Text('download'),
          ),
        ),
      ],
    ));
