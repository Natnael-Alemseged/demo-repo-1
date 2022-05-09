import 'package:app/Common_Components/Firebase/Firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bookDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: sized_box_for_whitespace
Widget BuildCard({required DocumentSnapshot snapshot}) => Container(
    width: 150,
    child: Column(children: [
      Expanded(
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Ink.image(
              image: CachedNetworkImageProvider(
                snapshot['bookCover'],
              ),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () async {
                  var x = snapshot.id;

                  //  .then((doc) => {var y=fromSnapshot.(documentSnapshot: doc);});
                  Get.to(bookDetails(snapshot: snapshot),
                      arguments: Transition.cupertino);
                },
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        snapshot['bookTitle'],
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      // Text(
      //   item.subtitle,
      //   style: TextStyle(
      //     fontSize: 16,
      //     color: Colors.black,
      //   ),
      // )
    ]));
