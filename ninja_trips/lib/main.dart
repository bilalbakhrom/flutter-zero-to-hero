import 'package:flutter/material.dart';
import 'package:ninja_trips/screens/home.dart';
import 'package:ninja_trips/screens/sandbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ninja Trips",
      home: Home(),
    );
  }
}

