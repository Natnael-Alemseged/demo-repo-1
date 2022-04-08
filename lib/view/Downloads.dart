import 'package:flutter/material.dart';
import 'package:get/get.dart';

//

class Downloads extends StatefulWidget {
  // const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Downloads'),
      ),
    );
  }
}
