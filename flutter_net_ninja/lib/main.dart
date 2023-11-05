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
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(40.0),
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('1'),
              ),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.all(40.0),
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text('2'),
              )
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(40.0),
              color: Colors.yellow,
              alignment: Alignment.center,
              child: const Text('3'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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











