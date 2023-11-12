import 'package:flutter/material.dart';
import 'package:ninja_trips/models/trip.dart';

class Details extends StatelessWidget {
  Trip trip;

  Details({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage('images/${trip.img}'),
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(trip.title,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text(
                            '${trip.nights} night stay for only \$${trip.price}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54))
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.favorite,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
