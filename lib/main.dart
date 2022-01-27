import 'strings.dart';
import 'views/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appname,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Playfair'
      ),
      home: const HomePage(),
    );
  }
}
