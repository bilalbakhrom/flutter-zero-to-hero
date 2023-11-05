import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'This is a body',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            color: Colors.black,
            fontFamily: 'Lato',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleButtonClick,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Text('Tap Me'),
      ),
    );
  }

  void handleButtonClick() {
    if (kDebugMode) {
      print('Done');
    }
  }
}












