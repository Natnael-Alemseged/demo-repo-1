import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/Model/Devices/device_Model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Controller/Device/DeviceBox.dart';
import 'package:app/Controller/Device/DeviceBox.dart';
import 'package:http/http.dart' as http;
//

class Downloads extends StatefulWidget {
  // const Downloads({Key? key}) : super(key: key);
  late var devices;

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  // void check() {
  //   final mybox = DeviceBox.getDevice();
  //   final devices = mybox.values;
  //   print(devices);
  // }

  @override
  Widget build(BuildContext context) {
    final mybox = DeviceBox.getDevice();

    final devices = mybox.get(0);
    var x = devices!.deviceID;

    // print(devices.deviceName);
    return Scaffold(
        body: Center(
            child: Column(children: [
      ElevatedButton(
          onPressed: () async {
            var response = await http.post(
                Uri.parse('https://limitless-bayou-11224.herokuapp.com/app.js'),
                body: jsonEncode(<String, String>{
                  'Email': 'Natiaabaydam@gmail.com',
                  'Password': "123345",
                  'Book_Name': 'sjdh',
                  'Device_Name': 'Galaxy A 31'
                }));
            if (response.statusCode == 201) {
              Get.snackbar('Successfull', response.statusCode.toString());
            } else {
              Get.snackbar("failed", response.statusCode.toString());
            }
          },
          child: Text('send Request')),
      Text(x),
    ]))

        // ValueListenableBuilder<Box<device_Model>>(
        //   valueListenable: DeviceBox.getDevice().listenable(),
        //   builder: (context, box, _) {
        //     final device = box.values.toList().cast<device_Model>();
        //     return buildContent(device);
        //},
        //),
        );
  }

  // Widget buildContent(List<device_Model> transactions) {
  //   return Column(children: [
  //     ElevatedButton(
  //       onPressed: () {//http.post(Uri.parse('https://limitless-bayoy-11224.herokuapp.com')),
  //       },
  //       child: Text('send Request'),
  //     ),
  //     Text(Hive.box('device').get('deviceID') + ' yelem meselegn jeles')
  //]);
  // if (transactions.isEmpty) {
  //   return Center(
  //     child: Text(
  //       'empty!',
  //       style: TextStyle(fontSize: 24),
  //     ),
  //   );
  // } else {
  //   /*  final netExpense = transactions.fold<double>(
  //     0,
  //     (previousValue, transaction) => transaction.isExpense
  //         ? previousValue - transaction.amount
  //         : previousValue + transaction.amount,
  //   );
  //   final newExpenseString = '\$${netExpense.toStringAsFixed(2)}';
  //   final color = netExpense > 0 ? Colors.green : Colors.red; */

  //   return ListView.builder(
  //       itemCount: transactions.length,
  //       itemBuilder: (context, index) {
  //         return Card(
  //           child: ListTile(
  //             title: Text(transactions[index].toString()),
  //           ),
  //         );
  //       });
  //}
}
