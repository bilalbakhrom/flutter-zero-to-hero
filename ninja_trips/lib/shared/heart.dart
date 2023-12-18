import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;
  late CurvedAnimation _curve;

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_curve);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 40), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 30), weight: 50),
    ]).animate(_curve);

    _controller.addStatusListener((status) {
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(Icons.favorite,
              color: _colorAnimation.value, size: _sizeAnimation.value),
          onPressed: () {
            isFavorite ? _controller.reverse() : _controller.forward();
            isFavorite = !isFavorite;
          },
        );
      },
    );
  }
}
