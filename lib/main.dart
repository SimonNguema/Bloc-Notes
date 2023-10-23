// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:bloc_notes/ajout.dart';
import 'package:bloc_notes/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}