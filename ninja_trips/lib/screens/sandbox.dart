import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 20;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 900),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              child: Text('animate width', style: TextStyle(color: Colors.white, backgroundColor: Colors.black)),
              onPressed: () => setState(() {
                _margin = 50;
                _color = Colors.purple;
                _width = 400;
                _opacity = 0;
              }),
            ),
            AnimatedOpacity(
                opacity: _opacity, 
                duration: Duration(seconds: 2),
              child: Text('Hide me', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
