import 'package:flutter/material.dart';
import 'package:ninja_trips/models/trip.dart';

class TripView extends StatelessWidget {
  Trip trip;

  TripView({super.key,  required this.trip });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage('images/${trip.img}'),
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${trip.nights} nights',
                style: const TextStyle(
                    color: Colors.blue
                ),
              ),
              Text(
                trip.title,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Text("\$${trip.price}"),
        ],
      ),
    );
  }
}
