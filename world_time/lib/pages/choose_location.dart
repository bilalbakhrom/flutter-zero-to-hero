import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Choose location screen',
          style: TextStyle(
              // color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container()
    );
  }
}
