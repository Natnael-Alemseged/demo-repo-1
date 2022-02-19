import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("hello world!"),
            centerTitle: true,
            backgroundColor: Colors.purple[500],
          ),
          body: const Center(
            child: Text("middle screen text"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Text("tap"),
            backgroundColor: Colors.blue[600],
          ),
        ),
      ),
    );
