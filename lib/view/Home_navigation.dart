import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Common_Components/Widgets/NavigationDrawerWidget.dart';
import 'Downloads.dart';
import 'Home.dart';
import 'Uploads.dart';

class HomeNavigationWidget extends StatefulWidget {
  HomeNavigationWidget({Key? key}) : super(key: key);

  @override
  State<HomeNavigationWidget> createState() => _HomeNavigationWidgetState();
}

class _HomeNavigationWidgetState extends State<HomeNavigationWidget> {
  var currentindex = 0;
  final screens = [
    Home(),
    Downloads(),
    Uploads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('navigationbar'),
      ),
      body: screens[currentindex],
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: <Widget>[],
      // ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) => setState(() => currentindex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Download',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
          ]),
    );
  }
}
