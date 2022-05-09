import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class comment extends StatefulWidget {
  var snapshot;
  comment({Key? key, required DocumentSnapshot this.snapshot})
      : super(key: key);

  @override
  State<comment> createState() => _commentState(snapshot: snapshot);
}

class _commentState extends State<comment> {
  var snapshot;
  _commentState({required DocumentSnapshot this.snapshot});
  @override
  Widget build(BuildContext context) {
    return Card(
        /*  shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 50),
              title: Text(snapshot['by']),
              subtitle: Text(snapshot['comment']),
            ),
          ),
        ],
      ), */
        );
  }
}
