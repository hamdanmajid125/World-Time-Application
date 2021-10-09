import 'package:flutter/material.dart';
import 'package:myfirst/homepage.dart';
import 'package:myfirst/loading.dart';
import 'package:myfirst/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(),
      routes: {
        '/home': (context) => HomePage(),
        '/location': (context) => const Location()
      },
    );
  }
}
