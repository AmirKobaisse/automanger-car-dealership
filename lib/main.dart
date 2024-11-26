import 'package:flutter/material.dart';
import 'car_list_page.dart';
import '';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Initialize the database factory for sqflite when using sqflite_common_ffi
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarListPage(),
    );
  }
}
